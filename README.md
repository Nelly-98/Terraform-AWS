# Terraform-AWS

![]()

## Contexte et objectif

Vous devrez contruire, déployer et automatiser le déploiement d'un site web Wordpress pour une entreprise dans laquelle vous venez d'être embauché en tant qu'ingénieur DevOps.

Voici les éléments nécéssaires que compose l'architecture :
- La région utilisée est Paris (eu-west-3)
- Le réseau de cette architecture, 1 VPC et 4 sous-réseaux (2 sous réseaux privés, 2 sous-réseaux publics)
- Une NAT gateway dans chaque sous réseau public pour assurer l'accès à internet aux sous-réseaux privé.
- Les instances de type t2.micro pour votre serveur web où sera installé wordpress dans un autoscaling group pour assurer les perfomances et la haute disponibilité. Votre code Terraform devra automatiquement récupérer les AMI disponibles et les zones de disponibilités correspondantes.
- Pour chaque groupes d'autoscaling crées, le minimum de machine sera configuré 1 et le maximum configuré à 2
- La base de données devra être déployée sur des instances. La ressource Terraform correspondante est aws_db_instance et le type db.t3.micro. Vous devrez donc la déployer dans 2 Avaibility Zones différentes (eu-west-3).
- Un équilibrage de charge de tyle ALB sera nécéssaire pour assurer la haute disponibilité de votre architecture.
- Un hôte bastion se chargera d'assurer un point d'entrée proxy et sécurisé. Bonus : pour assurer la haute disponibilité de ces serveurs ou l'accès est critique, vous pouvez les placer dans un autoscaling.
- L'accès à votre serveur web avec le protocol HTTP depuis un navigateur sur le port "80".

Bonus : configurez un accès sécurisé HTTPS (port 443 TLS) à votre serveur Web.

![](Screenshot 2024-02-23 at 02.47.44)
