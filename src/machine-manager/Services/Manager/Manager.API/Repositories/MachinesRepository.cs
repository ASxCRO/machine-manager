using Dapper;
using Manager.API.Data.Models;
using Manager.Shared.Models.DTOs;
using Microsoft.Extensions.Configuration;
using Npgsql;
using System.Collections.Generic;
using System.Data;
using System.Linq;

namespace Manager.API.Repositories
{
    public class MachinesRepository : IRepository<Machine>
    {
        private string connectionString;
        public MachinesRepository(IConfiguration configuration)
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
        public void Add(Machine item)
        { 
            using (IDbConnection dbConnection = Connection)
            {
                dbConnection.Open();
                dbConnection.Execute("INSERT INTO machines (name) VALUES(@Name)", item);
            }
        }

        public IEnumerable<Machine> FindAll()
        {
            using (IDbConnection dbConnection = Connection)
            {
                dbConnection.Open();
                var machines = dbConnection.Query<Machine>("SELECT * FROM machines");
                foreach (var item in machines)
                    item.Failures = dbConnection.Query<Failure>($"SELECT * FROM failures WHERE machineid = {item.Id}").ToList();
                return machines;
            }
        }

        public Machine FindByID(int id)
        {
            using (IDbConnection dbConnection = Connection)
            {
                dbConnection.Open();
                return dbConnection.Query<Machine>("SELECT * FROM machines WHERE id = @Id", new { Id = id }).FirstOrDefault();
            }
        }

        public void Remove(int id)
        {
            using (IDbConnection dbConnection = Connection)
            {
                dbConnection.Open();
                dbConnection.Execute("DELETE FROM failures WHERE MachineId=@Id", new { Id = id });
                dbConnection.Execute("DELETE FROM machines WHERE Id=@Id", new { Id = id });
            }
        }

        public void Update(Machine item)
        {
            using (IDbConnection dbConnection = Connection)
            {
                dbConnection.Open();
                dbConnection.Query("UPDATE machines SET name = @Name WHERE id = @Id", item);
            }
        }
    }
}
