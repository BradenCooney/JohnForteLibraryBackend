using CSharpFunctionalExtensions;
using System;
using System.Collections.Generic;
using System.Text;

namespace JohnForteLibrary.Domain.ValueObjects
{
    public class ISBN : SimpleValueObject<string>
    {
        private ISBN(string value) : base(value) {}

        public static Result<ISBN> Create(string isbn)
        {
            if (string.IsNullOrWhiteSpace(isbn))
                return Result.Failure<ISBN>("ISBN should not be empty");

            string noDashesIsbn = isbn.Replace("-", "");
            if (!ValidateISBNLength(noDashesIsbn)) return Result.Failure<ISBN>("ISBN should be 10 or 13 digits long");

            string noXIsbn = noDashesIsbn.ToUpper().Replace("X", "0");
            long longIsbn = 0;
            bool result = long.TryParse(noXIsbn, out longIsbn);

            result = (isbn.ToUpper().IndexOf('X') != isbn.Length - 1 && isbn.ToUpper().IndexOf('X') != -1);

            if (!result)
                return Result.Failure<ISBN>("ISBN must be in a valid format: only use numbers and dashes");

            return Result.Success(new ISBN(isbn));
        }

     

        private static bool ValidateISBNLength(string isbn)
        {
            const int validShortIsbnLength = 10;
            const int validLongIsbnLength = 13;

            return (isbn.Length != validShortIsbnLength && isbn.Length != validLongIsbnLength);
        }
    }

}


