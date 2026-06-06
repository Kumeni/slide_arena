const getSubscriptions = async () => {
    
    let subscriptions = await API.get("./api/get-subscriptions.php");
    console.log(subscriptions);
    updateSubscriptions(subscriptions);
}

const updateSubscriptions = (subscriptions) => {
    let subscriptionsContainer = document.getElementById("subscriptions-container");

    let innerHTML = `<tr>
        <th>#</th>
        <th>Cost (USDT)</th>
        <th>Max tournaments</th>
        <th>Duration</th>
        <th></th>
    </tr>`;

    subscriptions.forEach((subscription, index) => {
        innerHTML += `
        <tr>
            <td>${index+1}</td>
            <td>${subscription.cost}</td>
            <td>${subscription.max_tournaments}</td>
            <td>${subscription.duration_name}</td>
            <td><a href="./make-payment.php?subscription-id=${subscription.id}">Buy subscription</a></td>
        </tr>`;
    });

    subscriptionsContainer.innerHTML = innerHTML;
}

getSubscriptions();