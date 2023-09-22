const sql = require('msnodesqlv8');

// Connection string to connect to Azure SQL Database
const connectionString = 'Driver={ODBC Driver 18 for SQL Server};Server=jpxijh7dx33ufocm4v7f5exrau-vcfxphgs3anupd7urgruh3ewya.datawarehouse.pbidedicated.windows.net;Database=InforiverWB;Encrypt=yes;';
const query = "select * from dbo.table1;";

(async () => {
  sql.open(connectionString, (err, conn) => {
    if (err) {
      console.error(err);
      return;
    }
  
    conn.queryRaw(query, (err, results) => {
      if (err) {
        console.error(err);
        return;
      }
  
      console.log(results);
      conn.close();
    });
  });
})();