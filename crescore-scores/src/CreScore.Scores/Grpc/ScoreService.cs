using System;
using System.Collections.Generic;
using System.Globalization;
using System.Threading.Tasks;
using CreScore.Scores;
using Grpc.Core;

namespace Crescore.Scores.Grpc
{
    public class ScoreService : ScoresService.ScoresServiceBase
    {
        static readonly string[] GradeNames =
        {
            "Хуета, никому не понравится",
            "Мне не нравится, но мб кому-то ок",
            "Неплохо",
            "Хорошо",
            "Отлично",
            "Одна из лучших",
            "На кончиках пальцев"
        };

        static readonly string[] GameNames =
        {
            "Counter-Strike: Global Offensive", "Dota 2", "Flatout", "Need For Speed: Most Wanted", "Half-Life 2",
            "Horizon Zero Dawn", "New World", "Just Chatting", "Roblox", "Grand Theft Auto V", "League of Legends",
            "Fortnite", "Tabletop RPGs", "FIFA 22", "Counter-Strike: Global Offensive", "Apex Legends", "Halo Infinite",
            "VALORANT", "Call of Duty: Warzone", "Diablo II: Resurrected", "Super Smash Bros. Ultimate", "Music",
            "Dead by Daylight", "ASMR", "Minecraft", "Dota 2", "Hearthstone", "Slots", "Genshin Impact",
            "Escape from Tarkov", "Among Us", "World of Warcraft", "NBA 2K22", "Art", "Deltarune", "Rocket League",
            "Foxhole", "Final Fantasy XIV Online", "GeoGuessr", "The Sims 3", "Call Of Duty: Modern Warfare",
            "Garena Free Fire", "Travel & Outdoors", "Heroes of Might and Magic III: The Restoration of Erathia",
            "Destiny 2", "Tom Clancy's Rainbow Six Siege", "Teamfight Tactics", "Overwatch", "Rust", "Street Fighter V",
            "Pokémon Unite", "Sea of Thieves", "Axie Infinity", "Phasmophobia", "WWE SuperCard",
            "Red Dead Redemption 2", "SMITE", "The Last of Us", "PUBG: BATTLEGROUNDS", "Luigi's Mansion",
            "Call of Duty: Black Ops Cold War", "Special Events", "Magic: The Gathering", "Super Smash Bros. Melee",
            "Brawlhalla", "Sports", "Retro", "Pathfinder: Wrath of the Righteous", "Games + Demos", "Chess",
            "StarCraft II", "I'm Only Sleeping", "Old School RuneScape", "Hektor", "Dark Souls III", "Clash Royale",
            "Pokémon Sword/Shield", "Yu-Gi-Oh! Duel Links", "osu!", "Talk Shows & Podcasts", "Poker", "World of Tanks",
            "Jackbox Party Packs", "Midnight Cinema", "Pools, Hot Tubs, and Beaches", "DayZ", "Madden NFL 22",
            "Vampire: The Masquerade - Bloodhunt", "Cry of Fear", "Tibia", "Legion TD 2", "VRChat", "The Sims 4",
            "Melty Blood: Type Lumina", "Gartic Phone", "Black Desert Online", "Little Nightmares", "LOST ARK",
            "Paladins", "Arena of Valor", "Visage", "Science & Technology", "Pokémon Trading Card Game",
            "Fall Guys: Ultimate Knockout", "The Binding of Isaac: Repentance", "Gas Station Simulator"
        };

        private static readonly List<Game> Games = new();
        private static readonly List<Grade> Grades = new();

        static ScoreService()
        {
            var random = new Random();
            for (int i = 0; i < 50; i++)
            {
                Grades.Add(new()
                {
                    Id = i + 1,
                    Name = random.GetRandom(GradeNames),
                    Value = i
                });
            }

            for (int i = 0; i < 250; i++)
            {
                Games.Add(new Game
                {
                    Id = i + 1,
                    Name = random.GetRandom(GameNames),
                    Average = random.NextDouble() * Grades.Count,
                    Score = random.GetRandom(Grades)
                });
            }
        }

        public override Task<GetScoresResponse> GetScores(GetScoresRequest request, ServerCallContext context)
        {
            if (request.Count > Grades.Count)
                throw new ArgumentException($"{nameof(request.Count)} is bigger than number of grades.");

            var response = new GetScoresResponse();
            response.Grades.AddRange(Grades.GetRange(0, request.Count));
            return Task.FromResult(response);
        }

        public override Task<GetGamesResponse> GetGames(GetGamesRequest request, ServerCallContext context)
        {
            if (request.Count > Games.Count)
                throw new ArgumentException($"{nameof(request.Count)} is bigger than number of games.");

            var response = new GetGamesResponse();
            response.Games.AddRange(Games.GetRange(0, request.Count));
            return Task.FromResult(response);
        }
    }

    public static class RandomExtension
    {
        public static T GetRandom<T>(this Random random, IList<T> collection)
        {
            return collection[random.Next(collection.Count)];
        }
    }
}