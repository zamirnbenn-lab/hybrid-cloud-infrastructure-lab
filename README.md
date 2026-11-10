# Hybrid Cloud 3-Tier Infrastructure Lab

This project is a 3-tier environment built in Microsoft Azure around cloud networking, Linux, security, and infrastructure automation.

The environment uses an Ubuntu VM with Nginx for the web tier, Azure App Service for the application tier, and an Ubuntu VM running PostgreSQL for the data tier.

Azure uses the 10.20.0.0/16 network while my existing pfSense homelab uses 192.168.x.x networks. Since I plan on connecting the two later in the project, keeping the address spaces separate will make it easier. 

## Documentation

- [Architecture](docs/architecture.md)
- [Networking](docs/networking.md)
- [Service Choices](docs/service-choices.md)
- [Network Security](docs/network-security.md)
