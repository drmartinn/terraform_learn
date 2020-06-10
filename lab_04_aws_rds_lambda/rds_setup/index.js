const liquibase = require('liquibase');

exports.handler = async (event, context) => {

  var credentials = {
    user:     process.env.PGUSER,
    password: process.env.PGPASSWORD,
    database: process.env.PGNAMEBD,
    host:     process.env.PGENDPONT,
    port:     5432,
  };

  liquibase({
    changeLogFile: 'resources/changelog.sql',
    url: 'jdbc:postgresql://'+credentials.PGENDPONT+'/user',
    username: credentials.user,
    password: credentials.password
  })
  .run('update', '<action-params>')
  .then(() => console.log('success'))
  .catch((err) => console.log('fail', err));
};