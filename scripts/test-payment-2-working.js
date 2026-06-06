// send-usdt.js

// Your wallet address
const RECEIVER_ADDRESS = "0x39a483939E7E18A99e7aad3244e53188F2EF8AEf";

// Polygon USDT contract address
const USDT_CONTRACT_ADDRESS = "0xc2132D05D31c914a87C6611C10748AEb04B58e8F";

// Minimal ERC20 ABI
const ERC20_ABI = [
    "function transfer(address to, uint amount) returns (bool)",
    "function balanceOf(address owner) view returns (uint)",
    "function decimals() view returns (uint8)"
];

async function sendUSDT() {

    try {

        // Check if MetaMask exists
        if (!window.ethereum) {
            alert("MetaMask is not installed");
            return;
        }

        // Create provider
        const provider = new ethers.BrowserProvider(window.ethereum);

        // Request wallet connection
        await provider.send("eth_requestAccounts", []);

        // Get signer
        const signer = await provider.getSigner();

        // Check network
        const network = await provider.getNetwork();

        // Polygon Mainnet chainId = 137
        if (Number(network.chainId) !== 137) {
            alert("Please switch MetaMask to Polygon Mainnet");
            return;
        }

        // Create USDT contract instance
        const usdtContract = new ethers.Contract(
            USDT_CONTRACT_ADDRESS,
            ERC20_ABI,
            signer
        );

        // USDT uses 6 decimals
        const amount = ethers.parseUnits("0.1", 6);

        console.log("Sending 0.1 USDT...");

        // Send transaction
        const tx = await usdtContract.transfer(
            RECEIVER_ADDRESS,
            amount
        );

        console.log("Transaction submitted:");
        console.log(tx.hash);

        // Wait for confirmation
        const receipt = await tx.wait();

        console.log("Transaction confirmed:");
        console.log(receipt);

        alert("1 USDT sent successfully!");

    } catch (error) {

        console.error(error);

        if (error.code === 4001) {
            alert("User rejected transaction");
        } else {
            alert("Transaction failed");
        }

    }

}

// Run function
sendUSDT();