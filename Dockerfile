# Use an official ASP.NET Core runtime as a base image
FROM mcr.microsoft.com/dotnet/aspnet:7.0 AS base
WORKDIR /app
EXPOSE 8080

# Use the SDK image to build the application
FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build
WORKDIR /src
COPY ["MyAspNetCoreApp/MyAspNetCoreApp.csproj", "MyAspNetCoreApp/"]
RUN dotnet restore "MyAspNetCoreApp/MyAspNetCoreApp.csproj"
COPY . .
WORKDIR "/src/MyAspNetCoreApp"
RUN dotnet build "MyAspNetCoreApp.csproj" -c Release -o /app/build

# Publish the application
FROM build AS publish
RUN dotnet publish "MyAspNetCoreApp.csproj" -c Release -o /app/publish

# Create the final runtime image
FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "MyAspNetCoreApp.dll"]
