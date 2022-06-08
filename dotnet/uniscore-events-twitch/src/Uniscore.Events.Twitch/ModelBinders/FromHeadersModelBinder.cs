using System;
using System.Diagnostics;
using System.Linq;
using System.Text.Json.Serialization;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc.ModelBinding;
using CreScore.Events.Twitch.Core.Models;

namespace CreScore.Events.Twitch.ModelBinders
{
    public class FromHeadersModelBinder : IModelBinder
    {
        public Task BindModelAsync(ModelBindingContext bindingContext)
        {
            if (bindingContext.ModelType != typeof(HeaderValues))
            {
                bindingContext.Result = ModelBindingResult.Failed();
                return Task.CompletedTask;
            }

            var model = Activator.CreateInstance(bindingContext.ModelType);
            var modelProperties = bindingContext.ModelType.GetProperties();

            foreach (var property in modelProperties)
            {
                var customAttributes = property.GetCustomAttributes(typeof(JsonPropertyNameAttribute), false);
                Debug.Assert(customAttributes.Length == 1);
                var jsonNameAttribute = (JsonPropertyNameAttribute)customAttributes.Single();
                var headerName = jsonNameAttribute.Name;
                var stringValue = bindingContext.HttpContext.Request.Headers[headerName];

                var propertyType = property.PropertyType;
                if (propertyType == typeof(string))
                {
                    property.SetMethod!.Invoke(model, stringValue);
                    
                    
                    
                }
                //var parseMethod = propertyType.GetMethod();
                
                int a = 3;
            }

            bindingContext.Result = ModelBindingResult.Success(new HeaderValues());

            return Task.CompletedTask;
        }
    }
}