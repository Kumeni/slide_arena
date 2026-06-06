"use strict";

const request = (endpoint, options = {}) => {
    return new Promise((resolve, reject) => {

        const browserUUID = getBrowserUUID();

        const defaultHeaders = {
            "Content-Type": "application/json",
            "X-Browser-UUID": browserUUID
        };

        const method = options.method || "GET";

        const headers = {
            ...defaultHeaders,
            ...(options.headers || {})
        };

        // ✅ Add Bearer token if provided
        if (options.token) {
            headers["Authorization"] = `Bearer ${options.token}`;
        }

        const xhr = new XMLHttpRequest();
        xhr.open(method, endpoint, true);

        // Set headers
        for (const key in headers) {
            xhr.setRequestHeader(key, headers[key]);
        }

        xhr.onload = function () {
            if (xhr.status >= 200 && xhr.status < 300) {
                resolve(xhr);
            } else {
                console.log(xhr);
                reject(new Error(`HTTP error! Status: ${xhr.status}`));
            }
        };

        xhr.onerror = function () {
            reject(new Error("Network error"));
        };

        // Send request
        if (options.body) {
            xhr.send(options.body); // assume already JSON.stringify'ed
            console.log(options.body);
        } else {
            xhr.send();
        }
    });
}

const get = async (endpoint) => {
    let xhrResponse = await request(endpoint);
    //console.log(xhrResponse.response);
    return JSON.parse(xhrResponse.response);
}

const post = async (endpoint, data) => {
    let xhrResponse = await request(endpoint, {
        method: "POST",
        body: JSON.stringify(data)
    });
    console.log(xhrResponse.response);
    return JSON.parse(xhrResponse.response);
}

const getBrowserUUID = () => {
    let browserUUID = localStorage.getItem("browser_uuid");

    if (!browserUUID) return null;

    browserUUID = browserUUID.trim();

    return browserUUID.length ? browserUUID : null;
}

const getSubscriptionExpiryTime = async () => {
    const mySubscriptions = await get("./api/my-subscriptions.php");
    updateMaxTournamentGames(mySubscriptions.max_tournaments);

    return mySubscriptions.expiry_time;
}

const getTimeToExpiry = (futureDateTime) => {
    const now = new Date();
    const future = new Date(futureDateTime);

    let diff = future - now;

    // If time has already passed
    if (diff <= 0) {
        return {
            days: "00",
            hours: "00",
            minutes: "00",
            seconds: "00"
        };
    }

    const days = Math.floor(diff / (1000 * 60 * 60 * 24));
    diff %= (1000 * 60 * 60 * 24);

    const hours = Math.floor(diff / (1000 * 60 * 60));
    diff %= (1000 * 60 * 60);

    const minutes = Math.floor(diff / (1000 * 60));
    diff %= (1000 * 60);

    const seconds = Math.floor(diff / 1000);

    // Convert to double digits
    const format = (value) => String(value).padStart(2, "0");

    return {
        days: format(days),
        hours: format(hours),
        minutes: format(minutes),
        seconds: format(seconds)
    };
}

const updateTimeToExpiry = async () => {

    let expiryDateTime = await getSubscriptionExpiryTime();
    let timeToExpiry = getTimeToExpiry(expiryDateTime);
    document.getElementById("remaining-days").innerHTML = timeToExpiry.days;
    document.getElementById("remaining-hours").innerHTML = timeToExpiry.hours;
    document.getElementById("remaining-minutes").innerHTML = timeToExpiry.minutes;
    document.getElementById("remaining-seconds").innerHTML = timeToExpiry.seconds;
}

const updateMaxTournamentGames = (maxTournaments) => {
    document.getElementById("max_tournaments").innerHTML = maxTournaments;
}
const API = {
    get: (endpoint) => get(endpoint),
    post: (endpoint, data) => post(endpoint, data),
    getBrowserUUID: getBrowserUUID(),
    updateTimeToExpiry: () => updateTimeToExpiry()
};