const Certification = artifacts.require("CertificationNFT");
const fs = require("fs");

module.exports = async function (deployer, network, accounts) {
  try {
    console.log("Starting deployment...");
    console.log(`Deploying to network: ${network}`);
    console.log(`Using account: ${accounts[0]}`);

    // Deploy contract
    await deployer.deploy(Certification);
    const deployedCertification = await Certification.deployed();
    console.log(`Deployed CertificationNFT at: ${deployedCertification.address}`);

    // Save deployment address to a JSON file
    const configData = {
      network,
      Certification: deployedCertification.address,
    };
    const filePath = "./deployment_config.json";

    fs.writeFileSync(filePath, JSON.stringify(configData, null, 2));
    console.log(`Deployment address saved to: ${filePath}`);
  } catch (error) {
    console.error("Deployment failed:", error.message);
    console.error("Stack trace:", error.stack);
  }
};
