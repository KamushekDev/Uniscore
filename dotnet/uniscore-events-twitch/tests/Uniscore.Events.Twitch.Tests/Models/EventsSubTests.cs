using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using FluentAssertions.Json;
using Newtonsoft.Json;
using Newtonsoft.Json.Converters;
using Newtonsoft.Json.Linq;
using CreScore.Events.Twitch.Core.Models;
using Xunit;

namespace CreScore.Events.Twitch.Tests.Models
{
    public class EventsSubTests
    {
        public static IEnumerable<object[]> GetExampleJsonData()
        {
            var files = Directory.GetFiles(Path.Combine("Models", "Examples"),"*.json");

            return files.Select(s =>
            {
                var typeName = Path.GetFileNameWithoutExtension(s).Split('.').First();
                var transportFullName = typeof(Transport).FullName;
                var lastDot = transportFullName!.LastIndexOf('.');
                var namespaceString = transportFullName[..lastDot];

                var type = typeof(Transport).Assembly.GetType($"{namespaceString}.{typeName}");
                return new object[] { type, File.ReadAllText(s) };
            });
        }

        private void AssertEquivalentToJson<T>(string expectedJson, T actual) where T : class
        {
            var expected = JToken.Parse(expectedJson);

            var actualJson = JsonConvert.SerializeObject(actual,
                new JsonSerializerSettings
                {
                    Formatting = Formatting.None,
                    NullValueHandling = NullValueHandling.Ignore,
                    Converters = new List<JsonConverter> { new StringEnumConverter(true) }
                });

            var actualToken = JToken.Parse(actualJson);

            actualToken.Should().BeEquivalentTo(expected);
        }

        [Theory]
        [MemberData(nameof(GetExampleJsonData))]
        public void SerializerTest(Type type, string json)
        {
            Assert.NotNull(type);
            Assert.NotNull(json);

            var response = JsonConvert.DeserializeObject(json, type);

            AssertEquivalentToJson(json, response);
        }
    }
}