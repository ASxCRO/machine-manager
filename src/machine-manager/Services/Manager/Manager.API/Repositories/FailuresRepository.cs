using Dapper;
using Manager.API.Data.Models;
using Manager.Shared.Models.DTOs;
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
                var sqlFailures = $"INSERT INTO failures (name,machineid,description,priority,status) VALUES ('{item.Name}',{item.MachineId},'{item.Description}',{(int)item.Priority},{(int)item.Status})";
                dbConnection.Execute(sqlFailures);
                foreach (var attachement in item.Attachments)
                {
                    var failureId = dbConnection.QueryFirst<int>("SELECT id FROM failures ORDER BY checkintime DESC LIMIT 1");
                    var sqlAttachments = $"INSERT INTO failureattachments (failureid,attachment) VALUES ({failureId},'{attachement}')";
                    dbConnection.Execute(sqlAttachments);
                }
            }
        }
        public IEnumerable<Failure> FindAll()
        {
            using (IDbConnection dbConnection = Connection)
            {
                dbConnection.Open();
                var failures = dbConnection.Query<Failure>("SELECT * FROM failures");
                foreach (var fail in failures)
                {
                    fail.Attachments.AddRange(dbConnection.Query<byte[]>($"SELECT * FROM failureattachments WHERE failureid = {fail.Id}").ToList());
                }

                return failures;
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
                dbConnection.Execute("DELETE FROM failureattachments WHERE failureid=@Id", new { Id = id });
                dbConnection.Execute("DELETE FROM failures WHERE Id=@Id", new { Id = id });
            }
        }

        public void Update(Failure item)
        {
            using (IDbConnection dbConnection = Connection)
            {
                dbConnection.Open();
                dbConnection.Query($"UPDATE failures SET name = '{item.Name}', description = '{item.Description}', priority = {(int)item.Priority}, status = {(int)item.Status} WHERE id = {item.Id}");
                dbConnection.Execute("DELETE FROM failureattachments WHERE failureid=@Id", new { Id = item.Id });
                foreach (var attachement in item.Attachments)
                {
                    var sqlAttachments = $"INSERT INTO failureattachments (failureid,attachment) VALUES ({item.Id},'{attachement}')";
                    dbConnection.Execute(sqlAttachments);
                }
            }
        }

        public void UpdateStatus(Failure item)
        {
            using (IDbConnection dbConnection = Connection)
            {
                dbConnection.Open();
                dbConnection.Query($"UPDATE failures SET status = {(int)item.Status} WHERE id = {item.Id}");
            }
        }
    }
}
