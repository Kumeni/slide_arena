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

    //console.log(mySubscriptions);
    updateMaxTournamentGames(mySubscriptions.remaining_platform_sponsored_tournamens);

    return mySubscriptions.expiry_time;
}

const getTimeToExpiry = (futureDateTime) => {
    let now = new Date();
    let future = new Date(futureDateTime);

    if(futureDateTime == undefined){
        future = now;
    }

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

const updateTimeToExpiry = async (expiryDateTime) => {
    let timeToExpiry = getTimeToExpiry(expiryDateTime);
    document.getElementById("remaining-days").innerHTML = timeToExpiry.days;
    document.getElementById("remaining-hours").innerHTML = timeToExpiry.hours;
    document.getElementById("remaining-minutes").innerHTML = timeToExpiry.minutes;
    document.getElementById("remaining-seconds").innerHTML = timeToExpiry.seconds;
}

const updateMaxTournamentGames = (maxTournaments = 0) => {
    document.getElementById("max_tournaments").innerHTML = maxTournaments;
}

function createEventSource(url, events = {}) {
    const source = new EventSource(url);

    // Standard EventSource events
    if (typeof events.open === "function") {
        source.onopen = (event) => events.open(event, source);
    }

    if (typeof events.message === "function") {
        source.onmessage = (event) => events.message(event, source);
    }

    if (typeof events.error === "function") {
        source.onerror = (event) => events.error(event, source);
    }

    // Custom named events
    for (const [eventName, callback] of Object.entries(events)) {
        if (["open", "message", "error"].includes(eventName)) {
            continue;
        }

        if (typeof callback === "function") {
            source.addEventListener(eventName, (event) => {
                callback(event, source);
            });
        }
    }

    return source;
}

const fetchBrowserUUID = async () => {
    let browser_uuid = get("./api/get-browser-uuid.php");
    storeBrowserUUID(browser_uuid.browser_uuid);
    return browser_uuid.browser_uuid;
}

const storeBrowserUUID = (browserUUID) => {
    if (!browserUUID) return false;

    const existingUUID = localStorage.getItem("browser_uuid");

    if (existingUUID !== browserUUID) {
        localStorage.setItem("browser_uuid", browserUUID);
    }

    return true;
}

const API = {
    get: (endpoint) => get(endpoint),
    post: (endpoint, data) => post(endpoint, data),
    getBrowserUUID: getBrowserUUID(),
    updateTimeToExpiry: (expiryDateTime) => updateTimeToExpiry(expiryDateTime),
    createEventSource: (url, events)=>createEventSource(url, events),
    getSubscriptionExpiryTime: ()=> getSubscriptionExpiryTime(),
    fetchBrowserUUID: () => fetchBrowserUUID()
};