const fs = require('fs'),
      pg = require('pg');

exports.handler = async (event, context) => {

  var credentials = {
    user:     process.env.PGUSER,
    password: process.env.PGPASSWORD,
    database: process.env.PGNAMEBD,
    host:     process.env.PGENDPONT,
    port:     5432,
  };

  const pgClient = new pg.Client(credentials);

  await pgClient.connect();
  var results = await pgClient.query(process.env.SQL_SCRIPT);
  await pgClient.end();

  console.log(results.map(function(result) { return result.rowCount; }));
};