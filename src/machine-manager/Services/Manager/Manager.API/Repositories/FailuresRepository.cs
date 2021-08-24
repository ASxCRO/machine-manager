using Dapper;
using Manager.API.Data.Models;
using Microsoft.Extensions.Configuration;
using Npgsql;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;

namespace Manager.API.Repositories
{
    public class FailuresRepository : IRepository<Failure>
    {
        private string connectionString;
        public FailuresRepository(IConfiguration configuration)
        {
            connectionString = configuration.GetValue<string>("ConnectionStrings:MachinePGSQL");
        }

        internal IDbConnection Connection
        {
            get
            {
                return new NpgsqlConnection(connectionString);
            }
        }
        public void Add(Failure item)
        {
            using (IDbConnection dbConnection = Connection)
            {
                dbConnection.Open();
                var sql = $"INSERT INTO failures (machineid,description,priority,status) VALUES ({item.MachineId},'{item.Description}',{(int)item.Priority},{(int)item.Status})";
                dbConnection.Execute(sql);
            }
        }

        public IEnumerable<Failure> FindAll()
        {
            using (IDbConnection dbConnection = Connection)
            {
                dbConnection.Open();
                return dbConnection.Query<Failure>("SELECT * FROM failures");
            }
        }

        public Failure FindByID(int id)
        {
            using (IDbConnection dbConnection = Connection)
            {
                dbConnection.Open();
                return dbConnection.Query<Failure>("SELECT * FROM failures WHERE id = @Id", new { Id = id }).FirstOrDefault();
            }
        }

        public void Remove(int id)
        {
            using (IDbConnection dbConnection = Connection)
            {
                dbConnection.Open();
                dbConnection.Execute("DELETE FROM failures WHERE Id=@Id", new { Id = id });
            }
        }

        public void Update(Failure item)
        {
            using (IDbConnection dbConnection = Connection)
            {
                dbConnection.Open();
                dbConnection.Query($"UPDATE failures SET machineid={item.MachineId}, description = {item.Description}, priority = {item.Priority}, status = {item.Status} WHERE id = {item.Id}");
            }
        }
    }
}
