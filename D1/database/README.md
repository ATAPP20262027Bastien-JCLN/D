# Mise en place de la BDD

## Création de la base, des tables et utilisateur MariaDB

### Créer la base de données

Exécutez le script [`01-0_create_database.sql`](./scripts/01-0_create_database.sql).

### Créer les tables

Exécutez le script [`01-1_create_database_tables.sql`](./scripts/01-1_create_database_tables.sql).

### Créer l'utilisateur MariaDB

Exécutez le script [`01-2_create_database_user.sql`](./scripts/01-2_create_database_user.sql).

## Insérer les données de test

Déconnectez-vous et reconnectez-vous avec les identifiants suivants.

**Username:** `SwissBooking_bdd_mod`

**Password:** `Super`

Exécutez le script [`02_insert_data.sql`](./scripts/02_insert_data.sql).

## Lancer les requêtes de test

Une fois les données insérées, vous pouvez exécuter les requêtes de test afin de vérifier le contenu de la base de données.

Exécutez le script [`03_test_queries.sql`](./scripts/03_test_queries.sql).

Les requêtes permettent notamment de vérifier :

* les utilisateurs ;
* les recettes ;
* les catégories ;
* les ingrédients ;
* les commentaires ;
* les notes ;
* les favoris ;
* les différentes vues de l'application.
