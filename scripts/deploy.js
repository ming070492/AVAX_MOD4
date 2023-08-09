const hre = require("hardhat");

async function main() {

  const ctrct = await hre.ethers.deployContract("DegenToken");

  await ctrct.waitForDeployment();

  console.log(
    "CONTRACT ADDRESS: ", ctrct.target
  );
}


main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});

