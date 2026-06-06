// send-usdt.js

console.log("🟢 Script loaded");


// ===============================
// CONFIG
// ===============================

// Your receiving wallet
const RECEIVER_ADDRESS = "0x39a483939E7E18A99e7aad3244e53188F2EF8AEf";

// Polygon Mainnet USDT Contract
const USDT_CONTRACT_ADDRESS = "0xc2132D05D31c914a87C6611C10748AEb04B58e8F";

// Polygon Mainnet Chain ID
const POLYGON_CHAIN_ID = 137;

// Send amount
const SEND_AMOUNT = "0.05";


// ===============================
// ERC20 ABI
// ===============================

const ERC20_ABI = [

    "function transfer(address to, uint amount) returns (bool)",

    "function balanceOf(address owner) view returns (uint)",

    "function decimals() view returns (uint8)",

    "function symbol() view returns (string)"

];


// ===============================
// MAIN FUNCTION
// ===============================

async function sendUSDT() {

    console.log("🟡 [START] sendUSDT() called");

    try {

        // ===============================
        // CHECK METAMASK
        // ===============================

        console.log("🟡 [CHECK] Checking MetaMask");

        if (!window.ethereum) {

            console.error("🔴 MetaMask not detected");

            alert("MetaMask is not installed");

            return;

        }

        console.log("🟢 MetaMask detected");


        // ===============================
        // CREATE PROVIDER
        // ===============================

        console.log("🟡 [PROVIDER] Creating BrowserProvider");

        const provider = new ethers.BrowserProvider(window.ethereum);

        console.log("🟢 Provider created", provider);


        // ===============================
        // REQUEST ACCOUNTS
        // ===============================

        console.log("🟡 [WALLET] Requesting wallet access");

        await provider.send("eth_requestAccounts", []);

        console.log("🟢 Wallet access granted");


        // ===============================
        // GET SIGNER
        // ===============================

        console.log("🟡 [SIGNER] Getting signer");

        const signer = await provider.getSigner();

        console.log("🟢 Signer received");

        const userAddress = await signer.getAddress();

        console.log("🟢 User Address:", userAddress);


        // ===============================
        // GET NETWORK
        // ===============================

        console.log("🟡 [NETWORK] Checking network");

        const network = await provider.getNetwork();

        console.log("🟢 Network:", network);

        console.log("🟢 Chain ID:", Number(network.chainId));


        // ===============================
        // CHECK POLYGON NETWORK
        // ===============================

        if (Number(network.chainId) !== POLYGON_CHAIN_ID) {

            console.error("🔴 Wrong network");

            alert("Please switch MetaMask to Polygon Mainnet");

            return;

        }

        console.log("🟢 Polygon network confirmed");


        // ===============================
        // CREATE CONTRACT
        // ===============================

        console.log("🟡 [CONTRACT] Creating USDT contract");

        const usdtContract = new ethers.Contract(
            USDT_CONTRACT_ADDRESS,
            ERC20_ABI,
            signer
        );

        console.log("🟢 Contract created");



        // ===============================
        // GET TOKEN DETAILS
        // ===============================

        console.log("🟡 [TOKEN] Fetching token details");

        const symbol = await usdtContract.symbol();

        const decimals = await usdtContract.decimals();

        console.log("🟢 Token Symbol:", symbol);

        console.log("🟢 Token Decimals:", decimals);


        // ===============================
        // CHECK USER BALANCE
        // ===============================

        console.log("🟡 [BALANCE] Fetching balance");

        const rawBalance = await usdtContract.balanceOf(userAddress);

        console.log("🟢 Raw Balance:", rawBalance.toString());

        const formattedBalance = ethers.formatUnits(
            rawBalance,
            decimals
        );

        console.log("🟢 Formatted Balance:", formattedBalance);


        // ===============================
        // PREPARE AMOUNT
        // ===============================

        console.log("🟡 [AMOUNT] Preparing transfer amount");

        const amount = ethers.parseUnits(
            SEND_AMOUNT,
            decimals
        );

        console.log("🟢 Parsed Amount:", amount.toString());


        // ===============================
        // CHECK SUFFICIENT BALANCE
        // ===============================

        if (rawBalance < amount) {

            console.error("🔴 Insufficient USDT balance");

            alert("Insufficient USDT balance");

            return;

        }

        console.log("🟢 User has enough USDT");


        // ===============================
        // SEND TRANSACTION
        // ===============================

        console.log("🟡 [TRANSFER] Sending transaction");

        console.log("🟡 To:", RECEIVER_ADDRESS);

        console.log("🟡 Amount:", SEND_AMOUNT, symbol);

        const tx = await usdtContract.transfer(
            RECEIVER_ADDRESS,
            amount
        );

        console.log("🟢 Transaction submitted");

        console.log("🟢 Transaction Hash:", tx.hash);


        // ===============================
        // WAIT FOR CONFIRMATION
        // ===============================

        /*console.log("🟡 Waiting for confirmation manually...");

        let receipt = null;

        while (!receipt) {
            receipt = await provider.getTransactionReceipt(tx.hash);
            if (!receipt) {
                await new Promise(res => setTimeout(res, 3000));
            }
        }

        console.log("🟢 Receipt confirmed:", receipt);*/


        // ===============================
        // SUCCESS
        // ===============================

        alert("0.1 USDT sent successfully!");

    } catch (error) {

        // ===============================
        // ERROR DEBUGGING
        // ===============================

        console.error("🔴 FULL ERROR OBJECT:", error);

        console.log("🔴 Error Code:", error.code);

        console.log("🔴 Error Message:", error.message);

        console.log("🔴 Error Reason:", error.reason);

        console.log("🔴 Error Data:", error.data);

        console.log("🔴 Error Stack:", error.stack);

        console.log("🔴 Error Short Message:", error.shortMessage);

        // MetaMask user rejected
        if (error.code === 4001) {

            alert("User rejected the transaction");

        }

        // Insufficient gas
        else if (
            error.message &&
            error.message.toLowerCase().includes("insufficient funds")
        ) {

            alert("Insufficient POL for gas fees");

        }

        // Contract reverted
        else if (
            error.message &&
            error.message.toLowerCase().includes("execution reverted")
        ) {

            alert("Smart contract rejected the transaction");

        }

        // Generic fallback
        else {

            alert(
                "Transaction failed:\n\n" +
                (error.shortMessage ||
                error.reason ||
                error.message ||
                "Unknown error")
            );

        }

    }

}


// ===============================
// RUN
// ===============================

sendUSDT();