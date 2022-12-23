/* eslint-disable no-console */
/* eslint-disable promise/catch-or-return */
/* eslint-disable func-names */
/* eslint-disable promise/always-return */
/* eslint-disable prettier/prettier */
const { MSICreator } = require('electron-wix-msi');
const path = require('path');


const APP_DIR=path.resolve(__dirname,'./release/build/win-unpacked');

const OUT_DIR=path.resolve(__dirname,'./windows_installer');

const msiCreator=new MSICreator({
  appDirectory:APP_DIR,
  outputDirectory:OUT_DIR,


  exe:"Burgan Bank Anket",
  name:"Burgan Bank Anket",
  description:"Burgan Bank Anket",
  manufacturer:"Burgan Bank",
  version:"0.0.4",
  icon:"assets/icons/happy.ico",






  ui:{
    chooseDirectory:false,


  },

  features:{
    autoLaunch:true,


  }
});


// msiCreator.create().then(function(){

//   msiCreator.compile();
// });

async function createMsiSetup (){
await msiCreator.create().then(function(){
  msiCreator.compile();
})
}

createMsiSetup().catch(e=>{
  console.log(e);
})
