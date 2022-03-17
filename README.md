# Evolution Friday: Terraform Labb

## Del 0 - Setup
För att göra denna labben behövs:

1. Ett Azure-konto i vår testmiljö ImagineDLX<br>
*Om du inte har tillgång till den, maila <Servicedesk@asurgent.se>*
2. AZ CLI - [Download](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli)
3. Terraform - [Download](https://www.terraform.io/downloads)<br>
*Om du kör på en Windows-dator, följ denna guide: [Länk](https://docs.microsoft.com/en-us/azure/developer/terraform/get-started-windows-bash?tabs=bash)*

**Note:** Om ni kör via Visual Studio Code är Hashicorps Terraform extension att rekommendera för allehanda bekvämligheter :)<br>
Id: hashicorp.terraform<br>
[VS Marketplace Link](https://marketplace.visualstudio.com/items?itemName=HashiCorp.terraform)

## Del 1 - Skapa en Linux VM med Prometheus & Grafana
Instruktioner:

1. Ladda ner repot från GitHub: [Länk till repo](https://github.com/marren-asg/EvoDemo)
2. Gå till root-foldern
3. Öppna din favvo-terminal
4. logga in till Azure via kommandot:
	`$ az login`
5. Kolla igenom filen main.tf, det är den filen som ligger till grund för allt
6. Kolla igenom variables.tf, gissa vad den används till!? 
7. Kör kommandot:
	`$ Terraform init`
8. Kör kommandot:
	`$ Terraform plan`
9. Gå igenom outputen, vad är det som syns? Vad innebär det här?
10. Kör kommandot
	`$ Terraform apply`
11. Kolla i Azure-portalen om allt ser bra ut! Kom det några problem så fixa dessa!
12. Prova att ansluta till VM:en med den publika IP:n i ett webläsarfönster, testa på port 3000 (notera att det kan ta någon “azure-minut”). Grafana: username=admin, password=admin

## Del 2 - Förändring
Instruktioner:

13. Kolla state-filen, vad ser du där?
14. Prova ändra Region i terraform-koden (förslagsvis `north europe`)
15. Kör kommandot
	`$ Terraform plan`
16. Gå igenom outputen igen, vad är det som syns? Vad innebär det här?
17. Kör kommandot
	`$ Terraform apply`
18. Vänta någon “azure-minut”, kolla i portalen att allt ser bra ut, testa att ansluta till IP:n igen via webläsaren

## Del 3 – Självstudier & avslut
Instruktioner:

19. Testa att ändra VM:ens storlek! Ta bort den publika IP:n! Vart skulle dessa ändringar göras?
20. Fundera på om någon av delarna går att modularisera? Vilka? Varför?
21. Varför har Marcus & Anton strukturerat *.tf-filerna så som de gjort?
22. När ni känner er klara är det bara att avsluta labben, kör kommandot
	`$ Terraform Destroy`
23. Dubbelkolla också att inga rester ligger kvar! :)
