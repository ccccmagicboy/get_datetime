const core = require('@actions/core');

function run() {
  try {
    // This is just a thin wrapper around bash
    const script = require('path').resolve(__dirname, 'script.sh');
    console.log(script);
    
    const exec = require('child_process').exec;
    const testscript = exec('bash ' + script);

    testscript.stdout.on('data', function(data){
        console.log(data);
        // sendBackInfo();
    });

    testscript.stderr.on('data', function(data){
        console.log(data);
        // triggerErrorStuff();
    });    

    testscript.on('close', (code) => {
      console.log(`testscript process exited with code ${code}`);
      process.exit(code);
    });
  }
  catch (error) {
    core.setFailed(error.message);
  }
}

run()


