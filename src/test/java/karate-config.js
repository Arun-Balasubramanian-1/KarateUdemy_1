function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }
  var config = {
    env: env,
    myVarName: 'someValue'
  }
  if (env == 'dev') {
    config.apiUrl = 'https://conduit.productionready.io/api/'
    config.userEmail = 'testuser@yopmail.com'
    config.userName = 'testuserkarate'
    config.userPassword = 'test'
  } else if (env == 'e2e') {
    // customize
  }

  // karate.callSingle('classpath:helpers/Dummy2.feature')
  // karate.call('classpath:helpers/Dummy3.feature')


  var accessToken = karate.callSingle('classpath:helpers/createToken.feature', config).authToken
  karate.configure('headers', { Authorization: 'Token ' + accessToken })
  return config;
}