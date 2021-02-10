function fn()
{
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);

  if (!env)
  {
    env = 'test';
  }

  var config =
  {
    env: env,
	BASE_URL: ''
  };

  if (env == 'test')
  {
    config.BASE_URL = 'http://dummy.restapiexample.com/api/v1';
  }

  karate.configure('retry', { count: 10, interval: 2000 });

  return config;
}