| Bande de compétence                | Débutant (B)                                                                       | Intermédiaire (I)                                                                     | Avancé (A)                                                                                       |
| ---------------------------------- | ---------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------ |
| **D1 – Créer une base de données** | Je peux exécuter un script de création et reconnaître les principales contraintes. | Je peux créer les tables, clés primaires, clés étrangères et contraintes nécessaires. | Je peux justifier la structure créée et garantir sa cohérence, son intégrité et son évolutivité. |

| Bande de compétence                    | Débutant (B)                                                             | Intermédiaire (I)                                                                                         | Avancé (A)                                                                                                    |
| -------------------------------------- | ------------------------------------------------------------------------ | --------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------- |
| **D2 – Exploiter une base de données** | Je peux écrire des requêtes simples pour vérifier le contenu des tables. | Je peux écrire les requêtes nécessaires aux vues de l'application avec jointures, filtres et agrégations. | Je peux analyser et optimiser les requêtes et le schéma pour améliorer les performances et la maintenabilité. |

## 

## 1. Contexte & objectif du projet

Lors de la compétence C, vous avez conçu le modèle de données de l'application de gestion de recettes.

Vous devez maintenant transformer cette conception en une **base de données réellement exploitable**.

Votre mission consiste à :

- créer la structure réelle de la base de données ;
- conserver les scripts permettant de recréer la base ;
- créer toutes les tables ;
- définir les clés primaires et étrangères ;
- définir les contraintes nécessaires ;
- réfléchir au comportement des relations lors d'une suppression ;
- créer un utilisateur SQL dédié à l'application ;
- remplir toutes les tables avec des données réalistes ;
- identifier les données nécessaires à chaque vue ;
- écrire les requêtes permettant de récupérer ces données ;
- tester les requêtes ;
- vérifier que les informations attendues sont présentes ;
- réfléchir aux optimisations de votre schéma ;
- maintenir une structure de dossiers claire.

## 2. **ORGANISATION DU PROJET**

Maintenez une structure de dossiers claire.

```text
database/
├── schema/
│   ├── mcd/
│   └── mld/
│
├── scripts/
│   ├── 01_create_database.sql
│   ├── 02_insert_data.sql
│   └── 03_test_queries.sql
│
└── README.md
```

Tous les scripts permettant de reconstruire la base depuis zéro doivent être conservés.

Une base créée uniquement à la main dans phpMyAdmin ou dans un autre outil graphique n'est pas suffisante.

## 3.Structure de la base de données

À partir du **MLD réalisé dans la compétence C**, créez la base de données et toutes les tables nécessaires.

| Élément à vérifier                                                       | Réalisé | Justification / remarque                                                            |
| ------------------------------------------------------------------------ | :-----: | ----------------------------------------------------------------------------------- |
| Base de données créée                                                    |    ✅    | Dans le script pour éviter l'absence de celle-ci                                    |
| Toutes les tables du MLD sont présentes                                  |    ✅    | Le MLD est la base de données sans le script et un ajout d'une table pour les roles |
| Chaque table possède une clé primaire                                    |    ✅    | Pour une meilleur structure et classification                                       |
| Les clés étrangères sont présentes                                       |    ✅    | Pour le lien entre les tables                                                       |
| Les types de données sont adaptés                                        |    ✅    | Pour des cas généraux                                                               |
| Les champs obligatoires utilisent `NOT NULL` lorsque cela est nécessaire |    ✅    | Sécurité max                                                                        |
| Les contraintes d'unicité sont présentes lorsque cela est nécessaire     |    ✅    | Éviter des champs utile pour l'identification a double                              |
| Le comportement `ON DELETE` de chaque relation est défini                |    ✅    | Avec les différentes conditions                                                     |
| Le choix entre `CASCADE`, `RESTRICT` et `SET NULL` est justifié          |    ✅    | Pour les différents cas                                                             |
| Les règles `ON UPDATE` sont réfléchies lorsque cela est nécessaire       |    ✅    | Pas nécessaire mais mis par principe et sécurité                                    |

## **4.Scripts SQL**

Créez un dossier `scripts` et conservez les scripts nécessaires à la création, au remplissage et à la vérification de la base de données.

Votre base doit pouvoir être **entièrement reconstruite à partir de vos fichiers SQL**.

| Script                   | Contenu attendu                                                                                                                                      | Réalisé |
| ------------------------ | ---------------------------------------------------------------------------------------------------------------------------------------------------- | ------- |
| `01_create_database.sql` | Crée la base de données, toutes les tables, les clés primaires, les clés étrangères, les contraintes, les index et éventuellement l’utilisateur SQL. | ✅       |
| `02_insert_data.sql`     | Insère toutes les données de test réalistes dans les tables.                                                                                         | ✅       |
| `03_test_queries.sql`    | Contient toutes les requêtes permettant de vérifier la base et toutes les requêtes nécessaires aux vues.                                             | ☐       |

 

## 5. Utilisateur de la base de données

Créez un utilisateur qui sera l'administrateur ou l'exécutant de vos requêtes.

Cet utilisateur doit disposer uniquement des droits nécessaires.

| Élément                                       | Votre réponse                        |
| --------------------------------------------- | ------------------------------------ |
| Nom de l'utilisateur SQL                      | recipe_user                          |
| Base concernée                                | recipe_app                           |
| Droits accordés                               | SELECT, INSERT, UPDATE, DELETE       |
| Droits volontairement refusés                 | Tous le reste                        |
| Pourquoi ne pas utiliser directement `root` ? | Car il peux tout faire sur le server |

L'application ne doit pas se connecter à la base de données avec le compte :

```text
root
```

Vous devez appliquer le **principe du moindre privilège**.

Cela signifie que l'utilisateur de l'application reçoit uniquement les permissions dont il a réellement besoin.

## 6. Jeu de données

Chaque table doit être remplie avec un **jeu de données réel et cohérent** permettant de tester l'application.

Il ne suffit pas d'insérer une seule ligne dans chaque table.

Les données doivent permettre de tester différentes situations.

Par exemple :

- plusieurs utilisateurs ;
- plusieurs rôles ;
- plusieurs catégories ;
- ......
- des relations cohérentes entre les différentes données.

Complétez le tableau en fonction de votre propre modèle :

| Table         | Nombre de lignes prévu | Réalisé |
| ------------- | ---------------------- | ------- |
| `users`       | 3                      | ✅       |
| `roles`       | 2                      | ✅       |
| `recipes`     | 3                      | ✅       |
| `categories`  | 3                      | ✅       |
| `ingredients` | 6                      | ✅       |
| `comments`    | 3                      | ✅       |
| `ratings`     | 3                      | ✅       |
| `favorites`   | 6                      | ✅       |
| Autres tables | 6                      | ✅       |

## 7. Requêtes de vérification

Avant de connecter la base de données aux différentes vues de votre application, vous devez vérifier que les informations nécessaires sont réellement présentes.

Pour chaque besoin, écrivez une requête SQL permettant de vérifier les données.

| Information à vérifier                    | Requête SQL utilisée                                                                                                                   | Résultat attendu                                                                    |
| ----------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------- |
| Afficher tous les utilisateurs            | `SELECT id, name, email FROM users;`                                                                                                   | **3 utilisateurs** : Alice, Bob, Charlie                                            |
| Afficher toutes les recettes              | `SELECT id, name, description FROM recipes;`                                                                                           | **3 recettes** : Spaghetti Bolognese, Chicken Curry, Vegetable Stir Fry             |
| Afficher les recettes avec leur catégorie | `SELECT r.id, r.name, r.description, c.name AS category_name FROM recipes r JOIN categories c ON r.category_id = c.id;`                | **3 recettes** avec leurs catégories : Italian, Indian, Asian                       |
| Afficher les ingrédients d'une recette    | `SELECT i.name, ri.quantity, ri.unit FROM recipe_ingredients ri JOIN ingredients i ON ri.ingredient_id = i.id WHERE ri.recipe_id = 1;` | **3 ingrédients** : Spaghetti 200 grams, Ground Beef 150 grams, Tomato Sauce 100 ml |
| Afficher les commentaires d'une recette   | `SELECT u.name AS user_name, c.content, c.created_at FROM comments c JOIN users u ON c.user_id = u.id WHERE c.recipe_id = 1;`          | **1 commentaire** : Alice — « Delicious! My family loved it. »                      |
| Afficher la note moyenne d'une recette    | `SELECT AVG(score) AS average_rating FROM ratings WHERE recipe_id = 1;`                                                                | **5.00 / 5**                                                                        |
| Afficher les favoris d'un utilisateur     | `SELECT r.id, r.name, r.description FROM recipes r JOIN favorites f ON r.id = f.recipe_id WHERE f.user_id = 1;`                        | **2 favoris** : Chicken Curry et Vegetable Stir Fry                                 |

Toutes ces requêtes doivent être conservées dans :

```text
database/scripts/03_test_queries.sql
```

## 8. Requêtes nécessaires pour les vues

Reprenez les maquettes réalisées dans la compétence C.

Pour chaque page, posez-vous la question :

> **Quelles informations la page doit-elle recevoir depuis la base de données pour pouvoir être affichée ?**

Pour chaque vue, indiquez :

1. les informations à afficher ;
2. les tables nécessaires ;
3. les requêtes SQL nécessaires.

| Page / vue                     | Informations affichées                                                                  | Tables utilisées                                                                             | Requête(s) nécessaire(s)                                                                                                                                                                                                                          |
| ------------------------------ | --------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Accueil**                    | Recettes récentes/populaires, catégories, nom des recettes                              | `recipes`, `categories`, `ratings`                                                           | `SELECT r.id, r.name, r.description, c.name AS category_name FROM recipes r JOIN categories c ON r.category_id = c.id ORDER BY r.id DESC LIMIT 6;`                                                                                                |
| **Liste des recettes**         | Nom, description, catégorie, note moyenne                                               | `recipes`, `categories`, `ratings`                                                           | `SELECT r.id, r.name, r.description, c.name AS category_name, AVG(ra.score) AS average_rating FROM recipes r JOIN categories c ON r.category_id = c.id LEFT JOIN ratings ra ON r.id = ra.recipe_id GROUP BY r.id, r.name, r.description, c.name;` |
| **Détail d'une recette**       | Nom, description, catégorie, auteur, ingrédients, quantités, note moyenne, commentaires | `recipes`, `users`, `categories`, `recipe_ingredients`, `ingredients`, `ratings`, `comments` | Plusieurs requêtes : informations de la recette, ingrédients, note moyenne et commentaires                                                                                                                                                        |
| **Recherche**                  | Recettes correspondant au nom recherché                                                 | `recipes`, `categories`                                                                      | `SELECT r.id, r.name, r.description, c.name AS category_name FROM recipes r JOIN categories c ON r.category_id = c.id WHERE r.name LIKE '%mot%';`                                                                                                 |
| **Favoris**                    | Recettes enregistrées par l'utilisateur connecté                                        | `favorites`, `recipes`, `categories`                                                         | `SELECT r.id, r.name, r.description, c.name AS category_name FROM recipes r JOIN favorites f ON r.id = f.recipe_id LEFT JOIN categories c ON r.category_id = c.id WHERE f.user_id = ?;`                                                           |
| **Profil utilisateur**         | Nom, e-mail, rôle, éventuellement recettes publiées                                     | `users`, `roles`, `recipes`                                                                  | `SELECT u.id, u.name, u.email, ro.name AS role FROM users u JOIN roles ro ON u.id_role = ro.id WHERE u.id = ?;`                                                                                                                                   |
| **Administration**             | Utilisateurs, rôles, recettes, catégories, commentaires                                 | `users`, `roles`, `recipes`, `categories`, `comments`                                        | Plusieurs requêtes selon la section administrée                                                                                                                                                                                                   |
| **Création d'une recette**     | Formulaire : nom, description, catégorie, ingrédients, quantités                        | `recipes`, `categories`, `ingredients`, `recipe_ingredients`                                 | `INSERT INTO recipes ...`, puis `INSERT INTO recipe_ingredients ...`                                                                                                                                                                              |
| **Modification d'une recette** | Données actuelles de la recette + formulaire de modification                            | `recipes`, `categories`, `ingredients`, `recipe_ingredients`                                 | `SELECT ... WHERE id = ?`, puis `UPDATE recipes ...`                                                                                                                                                                                              |
| **Gestion des catégories**     | Liste, création, modification et suppression des catégories                             | `categories`, `recipes`                                                                      | `SELECT`, `INSERT`, `UPDATE`, `DELETE`                                                                                                                                                                                                            |
| **Gestion des utilisateurs**   | Liste des utilisateurs, e-mail, rôle                                                    | `users`, `roles`                                                                             | `SELECT u.id, u.name, u.email, r.name AS role FROM users u JOIN roles r ON u.id_role = r.id;`                                                                                                                                                     |
| **Gestion des commentaires**   | Commentaires, auteur, recette, date                                                     | `comments`, `users`, `recipes`                                                               | `SELECT c.id, u.name, r.name, c.content, c.created_at FROM comments c JOIN users u ON c.user_id = u.id JOIN recipes r ON c.recipe_id = r.id;`                                                                                                     |


## 9. Écrire les requêtes nécessaires aux vues

Vous devez maintenant écrire réellement les requêtes identifiées précédemment.

Pour une page comme :

```text
Détail d'une recette
```

vous pourriez avoir besoin de récupérer :

- le nom de la recette ;
- sa description ;
- son auteur ;
- sa catégorie ;
- ses ingrédients ;
- ses commentaires ;
- sa note moyenne.

Vous devez alors déterminer :

```text
Vue
 ↓
Informations nécessaires
 ↓
Tables concernées
 ↓
Relations entre les tables
 ↓
Requête SQL
 ↓
Résultat
```

L'objectif n'est donc pas simplement de savoir faire un `SELECT`.

Vous devez être capable de partir d'un **besoin de l'interface** et de déterminer la requête nécessaire.

## 10. Test des requêtes

Écrivez les requêtes puis exécutez-les afin de vérifier que les informations attendues sont présentes.

Pour chaque requête :

1. écrivez la requête ;
2. ajoutez-la dans `03_test_queries.sql` ;
3. exécutez-la ;
4. observez le résultat ;
5. vérifiez que les informations correspondent aux besoins de la vue.

---

### 10.1 Accueil

<details>
<summary><strong>Requête testée</strong></summary>

```sql
SELECT
    r.id,
    r.name,
    r.description,
    c.name AS category_name
FROM recipes r
JOIN categories c ON r.category_id = c.id
ORDER BY r.id DESC
LIMIT 6;
```

</details>

<details>
<summary><strong>Résultat attendu</strong></summary>

Les recettes sont affichées avec leur catégorie.

Avec les données de test :

| id | name                | category_name |
| -: | ------------------- | ------------- |
|  3 | Vegetable Stir Fry  | Asian         |
|  2 | Chicken Curry       | Indian        |
|  1 | Spaghetti Bolognese | Italian       |

</details>

**Résultat correct :** ☑

---

### 10.2 Liste des recettes

<details>
<summary><strong>Requête testée</strong></summary>

```sql
SELECT
    r.id,
    r.name,
    r.description,
    c.name AS category_name,
    ROUND(AVG(ra.score), 2) AS average_rating
FROM recipes r
JOIN categories c ON r.category_id = c.id
LEFT JOIN ratings ra ON r.id = ra.recipe_id
GROUP BY
    r.id,
    r.name,
    r.description,
    c.name;
```

</details>

<details>
<summary><strong>Résultat attendu</strong></summary>

Les trois recettes doivent être affichées avec leur catégorie et leur note moyenne.

| id | name                | category_name | average_rating |
| -: | ------------------- | ------------- | -------------: |
|  1 | Spaghetti Bolognese | Italian       |           5.00 |
|  2 | Chicken Curry       | Indian        |           4.00 |
|  3 | Vegetable Stir Fry  | Asian         |           5.00 |

</details>

**Résultat correct :** ☑

---

### 10.3 Détail d'une recette

Pour cette vue, plusieurs requêtes sont nécessaires.

#### Informations principales

<details>
<summary><strong>Requête testée</strong></summary>

```sql
SELECT
    r.id,
    r.name,
    r.description,
    u.name AS author,
    c.name AS category
FROM recipes r
JOIN users u ON r.user_id = u.id
JOIN categories c ON r.category_id = c.id
WHERE r.id = 1;
```

</details>

<details>
<summary><strong>Résultat attendu</strong></summary>

| id | name                | author | category |
| -: | ------------------- | ------ | -------- |
|  1 | Spaghetti Bolognese | Alice  | Italian  |

</details>

**Résultat correct :** ☑

#### Ingrédients

<details>
<summary><strong>Requête testée</strong></summary>

```sql
SELECT
    i.name,
    ri.quantity,
    ri.unit
FROM recipe_ingredients ri
JOIN ingredients i ON ri.ingredient_id = i.id
WHERE ri.recipe_id = 1;
```

</details>

<details>
<summary><strong>Résultat attendu</strong></summary>

| name         | quantity | unit  |
| ------------ | -------: | ----- |
| Spaghetti    |   200.00 | grams |
| Ground Beef  |   150.00 | grams |
| Tomato Sauce |   100.00 | ml    |

</details>

**Résultat correct :** ☑

#### Note moyenne

<details>
<summary><strong>Requête testée</strong></summary>

```sql
SELECT
    ROUND(AVG(score), 2) AS average_rating
FROM ratings
WHERE recipe_id = 1;
```

</details>

<details>
<summary><strong>Résultat attendu</strong></summary>

```text
5.00
```

</details>

**Résultat correct :** ☑

#### Commentaires

<details>
<summary><strong>Requête testée</strong></summary>

```sql
SELECT
    u.name AS user_name,
    c.content,
    c.created_at
FROM comments c
JOIN users u ON c.user_id = u.id
WHERE c.recipe_id = 1
ORDER BY c.created_at DESC;
```

</details>

<details>
<summary><strong>Résultat attendu</strong></summary>

```text
Alice
Delicious! My family loved it.
```

</details>

**Résultat correct :** ☑

---

### 10.4 Recherche

Pour tester la recherche de `curry` :

<details>
<summary><strong>Requête testée</strong></summary>

```sql
SELECT
    r.id,
    r.name,
    r.description,
    c.name AS category_name
FROM recipes r
JOIN categories c ON r.category_id = c.id
WHERE r.name LIKE '%curry%';
```

</details>

<details>
<summary><strong>Résultat attendu</strong></summary>

| id | name          | category_name |
| -: | ------------- | ------------- |
|  2 | Chicken Curry | Indian        |

</details>

**Résultat correct :** ☑

---

### 10.5 Favoris

Pour tester les favoris de l'utilisateur `1` :

<details>
<summary><strong>Requête testée</strong></summary>

```sql
SELECT
    r.id,
    r.name,
    r.description
FROM recipes r
JOIN favorites f ON r.id = f.recipe_id
WHERE f.user_id = 1;
```

</details>

<details>
<summary><strong>Résultat attendu</strong></summary>

L'utilisateur Alice possède deux favoris :

| id | name               |
| -: | ------------------ |
|  2 | Chicken Curry      |
|  3 | Vegetable Stir Fry |

</details>

**Résultat correct :** ☑

---

### 10.6 Profil utilisateur

Pour tester le profil d'Alice :

<details>
<summary><strong>Requête testée</strong></summary>

```sql
SELECT
    u.id,
    u.name,
    u.email,
    r.name AS role
FROM users u
JOIN roles r ON u.id_role = r.id
WHERE u.id = 1;
```

</details>

<details>
<summary><strong>Résultat attendu</strong></summary>

| id | name  | email                                                                     | role |
| -: | ----- | ------------------------------------------------------------------------- | ---- |
|  1 | Alice | [[alice@example.com](mailto:alice@example.com)](mailto:alice@example.com) | user |

</details>

**Résultat correct :** ☑

---

### 10.7 Administration

Pour l'administration, plusieurs informations doivent être testées.

#### Utilisateurs

<details>
<summary><strong>Requête testée</strong></summary>

```sql
SELECT
    u.id,
    u.name,
    u.email,
    r.name AS role
FROM users u
JOIN roles r ON u.id_role = r.id
ORDER BY u.id;
```

</details>

<details>
<summary><strong>Résultat attendu</strong></summary>

**3 utilisateurs**.

</details>

**Résultat correct :** ☑

#### Recettes

<details>
<summary><strong>Requête testée</strong></summary>

```sql
SELECT
    r.id,
    r.name,
    u.name AS author,
    c.name AS category
FROM recipes r
LEFT JOIN users u ON r.user_id = u.id
LEFT JOIN categories c ON r.category_id = c.id
ORDER BY r.id;
```

</details>

<details>
<summary><strong>Résultat attendu</strong></summary>

**3 recettes**, avec leur auteur et leur catégorie.

</details>

**Résultat correct :** ☑

#### Commentaires

<details>
<summary><strong>Requête testée</strong></summary>

```sql
SELECT
    c.id,
    u.name AS user_name,
    r.name AS recipe_name,
    c.content,
    c.created_at
FROM comments c
JOIN users u ON c.user_id = u.id
JOIN recipes r ON c.recipe_id = r.id
ORDER BY c.created_at DESC;
```

</details>

<details>
<summary><strong>Résultat attendu</strong></summary>

**3 commentaires**.

</details>

**Résultat correct :** ☑

---

## Récapitulatif

| Vue                  | Requête testée | Résultat correct | Commentaire                                                                      |
| -------------------- | :------------: | :--------------: | -------------------------------------------------------------------------------- |
| Accueil              |        ☑       |         ☑        | Les recettes et leurs catégories sont correctement affichées.                    |
| Liste des recettes   |        ☑       |         ☑        | Les 3 recettes et leurs notes moyennes sont retournées.                          |
| Détail d'une recette |        ☑       |         ☑        | Les informations, ingrédients, commentaires et note sont correctement récupérés. |
| Recherche            |        ☑       |         ☑        | La recherche retourne la recette correspondant au terme recherché.               |
| Favoris              |        ☑       |         ☑        | Les favoris de l'utilisateur sont correctement récupérés.                        |
| Profil utilisateur   |        ☑       |         ☑        | Les informations de l'utilisateur et son rôle sont correctement affichés.        |
| Administration       |        ☑       |         ☑        | Les utilisateurs, recettes et commentaires sont correctement récupérés.          |

## 11. Cohérence des données

Votre jeu de données doit également permettre de vérifier les relations entre les tables.

Vous devez notamment vérifier :

* qu'une recette possède un auteur existant ;
* qu'une recette appartient à une catégorie existante ;
* qu'un commentaire appartient à un utilisateur existant ;
* qu'un commentaire concerne une recette existante ;
* qu'une note concerne une recette existante ;
* qu'un favori relie correctement un utilisateur et une recette ;
* qu'un ingrédient associé à une recette existe réellement.

### Vérification des relations

<details>
<summary><strong>Recette → Auteur</strong></summary>

```sql
SELECT
    r.id,
    r.name AS recipe_name,
    u.name AS author
FROM recipes r
JOIN users u ON r.user_id = u.id;
```

Les trois recettes possèdent un auteur existant.

</details>

<details>
<summary><strong>Recette → Catégorie</strong></summary>

```sql
SELECT
    r.id,
    r.name AS recipe_name,
    c.name AS category
FROM recipes r
JOIN categories c ON r.category_id = c.id;
```

Les trois recettes appartiennent à une catégorie existante.

</details>

<details>
<summary><strong>Commentaire → Utilisateur</strong></summary>

```sql
SELECT
    c.id,
    c.content,
    u.name AS user_name
FROM comments c
JOIN users u ON c.user_id = u.id;
```

Les trois commentaires appartiennent à un utilisateur existant.

</details>

<details>
<summary><strong>Commentaire → Recette</strong></summary>

```sql
SELECT
    c.id,
    c.content,
    r.name AS recipe_name
FROM comments c
JOIN recipes r ON c.recipe_id = r.id;
```

Les trois commentaires concernent une recette existante.

</details>

<details>
<summary><strong>Note → Recette</strong></summary>

```sql
SELECT
    ra.id,
    ra.score,
    r.name AS recipe_name
FROM ratings ra
JOIN recipes r ON ra.recipe_id = r.id;
```

Les trois notes concernent une recette existante.

</details>

<details>
<summary><strong>Favori → Utilisateur et recette</strong></summary>

```sql
SELECT
    f.id,
    u.name AS user_name,
    r.name AS recipe_name
FROM favorites f
JOIN users u ON f.user_id = u.id
JOIN recipes r ON f.recipe_id = r.id;
```

Les favoris relient correctement un utilisateur et une recette existants.

</details>

<details>
<summary><strong>Ingrédient associé → Ingrédient</strong></summary>

```sql
SELECT
    ri.id,
    r.name AS recipe_name,
    i.name AS ingredient_name,
    ri.quantity,
    ri.unit
FROM recipe_ingredients ri
JOIN recipes r ON ri.recipe_id = r.id
JOIN ingredients i ON ri.ingredient_id = i.id;
```

Tous les ingrédients associés aux recettes existent réellement.

</details>

### Que se passe-t-il si vous essayez d'insérer une donnée qui référence un élément inexistant ?

Les relations entre les tables sont protégées par des **clés étrangères (`FOREIGN KEY`)**.

Si on essaie, par exemple, d'insérer une recette avec un `user_id` qui n'existe pas dans la table `users`, MariaDB refuse l'insertion et renvoie une erreur de contrainte de clé étrangère.

Par exemple :

```sql
INSERT INTO recipes (name, description, user_id, category_id)
VALUES ('Test Recipe', 'Test', 999, 1);
```

Comme l'utilisateur `999` n'existe pas, l'insertion est refusée.

Cela permet d'éviter d'avoir des données incohérentes ou des références vers des éléments inexistants.

## 12. Gestion de la suppression et intégrité référentielle

Lorsqu'une table est liée à une autre par une **clé étrangère**, vous devez décider ce qui doit se passer lorsqu'une donnée est supprimée.

### Choisir le comportement des relations

Pour chaque relation importante de votre base, déterminez le comportement qui vous semble le plus adapté.

| Relation                   | CASCADE | RESTRICT | SET NULL | Choix retenu | Justification                                                                         |
| -------------------------- | :-----: | :------: | :------: | ------------ | ------------------------------------------------------------------------------------- |
| Utilisateur → Recettes     |    ☐    |     ☐    |     ☑    | **SET NULL** | Les recettes peuvent être conservées même si leur auteur supprime son compte.         |
| Utilisateur → Commentaires |    ☑    |     ☐    |     ☐    | **CASCADE**  | Les commentaires d'un utilisateur sont supprimés avec son compte.                     |
| Utilisateur → Favoris      |    ☑    |     ☐    |     ☐    | **CASCADE**  | Les favoris d'un utilisateur n'ont plus d'utilité après la suppression de son compte. |
| Utilisateur → Notes        |    ☑    |     ☐    |     ☐    | **CASCADE**  | Les notes associées au compte sont supprimées avec celui-ci.                          |
| Recette → Commentaires     |    ☑    |     ☐    |     ☐    | **CASCADE**  | Les commentaires concernent une recette précise et sont supprimés avec celle-ci.      |
| Recette → Notes            |    ☑    |     ☐    |     ☐    | **CASCADE**  | Les notes concernent une recette précise et sont supprimées avec celle-ci.            |
| Recette → Favoris          |    ☑    |     ☐    |     ☐    | **CASCADE**  | Les favoris associés à une recette supprimée doivent également être supprimés.        |
| Catégorie → Recettes       |    ☐    |     ☐    |     ☑    | **SET NULL** | Une recette peut être conservée même si sa catégorie est supprimée.                   |
| Autre relation             |    ☐    |     ☑    |     ☐    | **RESTRICT** | Le rôle d'un utilisateur doit exister tant que des utilisateurs l'utilisent.          |

### Situation 1 – Suppression d'un utilisateur

Un utilisateur supprime son compte.

Il possède :

* 12 recettes ;
* 34 commentaires ;
* 8 notes ;
* 25 favoris.

**Que doit-il arriver aux recettes ?**

Les 12 recettes doivent être conservées, mais leur `user_id` doit être mis à `NULL`.

**Que doit-il arriver aux commentaires ?**

Les 34 commentaires doivent être supprimés.

**Que doit-il arriver aux notes ?**

Les 8 notes doivent être supprimées.

**Que doit-il arriver aux favoris ?**

Les 25 favoris doivent être supprimés.

**Justifiez vos choix :**

Les recettes sont conservées afin de ne pas supprimer du contenu qui peut rester utile aux autres utilisateurs. Leur auteur est simplement retiré grâce à `ON DELETE SET NULL`.

Les commentaires, notes et favoris sont directement liés au compte de l'utilisateur. Ils sont donc supprimés avec celui-ci grâce à `ON DELETE CASCADE`.

### Situation 2 – Suppression d'une catégorie

Un administrateur souhaite supprimer une catégorie contenant encore **48 recettes**.

Que choisissez-vous ?

* ☐ `CASCADE`
* ☐ `RESTRICT`
* ☑ `SET NULL`
* ☐ Une autre solution

**Pourquoi ?**

Les 48 recettes ne doivent pas être supprimées simplement parce que leur catégorie est supprimée.

Avec `SET NULL`, les recettes sont conservées et leur `category_id` devient `NULL`. Cela permet de supprimer la catégorie sans perdre les recettes associées.

### Situation 3 – Suppression d'une recette

Une recette est supprimée.

Elle possède :

* 15 commentaires ;
* 22 notes ;
* 40 favoris ;
* plusieurs ingrédients associés.

**Quelles données doivent également être supprimées ?**

Les 15 commentaires, les 22 notes, les 40 favoris et les associations avec les ingrédients doivent également être supprimés.

**Quelles données doivent éventuellement être conservées ?**

Les ingrédients eux-mêmes doivent être conservés, car ils peuvent être utilisés par d'autres recettes. Seule leur association avec la recette supprimée doit disparaître.

**Quelles règles `ON DELETE` allez-vous utiliser ?**

Les relations entre une recette et ses commentaires, notes et favoris utilisent `ON DELETE CASCADE`.

La relation avec `recipe_ingredients` utilise également `ON DELETE CASCADE`. Les ingrédients eux-mêmes ne sont donc pas supprimés.

### Règle métier et règle technique

Le choix entre :

```text
CASCADE
RESTRICT
SET NULL
```

ne doit pas être fait uniquement pour des raisons techniques.

Il doit correspondre aux **règles métier de l'application**.

Avant de créer une clé étrangère, posez-vous toujours la question :

> **« Si cette donnée disparaît, que doit-il arriver aux données qui dépendent d'elle ? »**

## 13. Optimisations du schéma

Une base de données fonctionnelle n'est pas nécessairement une base de données bien conçue.

Analysez votre schéma et indiquez les optimisations présentes.

| Optimisation                                          | Présente ? | Où ?                                                                                                                                                                                                                                                        | Pourquoi ?                                                                                                                                                   |
| ----------------------------------------------------- | :--------: | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| Index sur les clés étrangères                         |      ☑     | `users.id_role`, `recipes.user_id`, `recipes.category_id`, `recipe_ingredients.recipe_id`, `recipe_ingredients.ingredient_id`, `favorites.user_id`, `favorites.recipe_id`, `ratings.user_id`, `ratings.recipe_id`, `comments.user_id`, `comments.recipe_id` | Les clés étrangères permettent de maintenir les relations entre les tables et MariaDB peut utiliser les index associés pour les recherches et les jointures. |
| Index sur les colonnes souvent recherchées            |      ☐     | —                                                                                                                                                                                                                                                           | Aucun index spécifique n'a été créé sur les colonnes utilisées pour la recherche, comme `recipes.name`.                                                      |
| Contraintes `UNIQUE`                                  |      ☑     | `users.email`, `categories.name`, `ingredients.name` et les relations plusieurs-à-plusieurs                                                                                                                                                                 | Elles empêchent les doublons et garantissent l'unicité des données concernées.                                                                               |
| Types de données adaptés                              |      ☑     | Ensemble du schéma                                                                                                                                                                                                                                          | Les types sont adaptés aux données stockées : `INT` pour les identifiants, `DECIMAL` pour les quantités, `TEXT` pour les descriptions et commentaires, etc.  |
| Longueurs `VARCHAR` raisonnables                      |      ☑     | `roles.name`, `users.name`, `users.email`, `categories.name`, `ingredients.name`, etc.                                                                                                                                                                      | Les longueurs définies sont suffisantes pour les informations stockées sans utiliser des types inutilement volumineux.                                       |
| Relations plusieurs-à-plusieurs correctement séparées |      ☑     | `recipe_ingredients`, `favorites`, `ratings`                                                                                                                                                                                                                | Les tables intermédiaires permettent de gérer correctement les relations entre plusieurs utilisateurs, recettes et ingrédients.                              |
| Suppression des données dupliquées                    |      ☑     | Structure générale et contraintes `UNIQUE`                                                                                                                                                                                                                  | Les informations sont séparées dans différentes tables afin d'éviter de stocker plusieurs fois les mêmes données.                                            |
| Contraintes d'intégrité référentielle                 |      ☑     | Toutes les relations avec `FOREIGN KEY`                                                                                                                                                                                                                     | Elles empêchent les références vers des données inexistantes et maintiennent la cohérence entre les tables.                                                  |
| Règles `ON DELETE` adaptées                           |      ☑     | Toutes les clés étrangères                                                                                                                                                                                                                                  | `CASCADE`, `SET NULL` et `RESTRICT` sont utilisés selon le comportement attendu lors d'une suppression.                                                      |
| Règles `ON UPDATE` adaptées                           |      ☑     | Toutes les clés étrangères                                                                                                                                                                                                                                  | Les relations utilisent `ON UPDATE CASCADE`, ce qui permet de mettre à jour automatiquement les références si un identifiant est modifié.                    |
| Autre optimisation                                    |      ☐     | —                                                                                                                                                                                                                                                           | —                                                                                                                                                            |

### Les trois optimisations les plus importantes

### Optimisation 1

**Optimisation :**

Contraintes d'intégrité référentielle avec les clés étrangères.

**Justification :**

Les clés étrangères sont utilisées entre les différentes tables, notamment entre `recipes` et `users`, `recipes` et `categories`, ainsi qu'entre les tables intermédiaires et leurs tables principales.

Elles empêchent l'insertion de références vers des éléments inexistants et garantissent la cohérence des relations entre les données.

### Optimisation 2

**Optimisation :**

Relations plusieurs-à-plusieurs correctement séparées.

**Justification :**

Les relations entre les recettes et les ingrédients sont gérées par `recipe_ingredients`. Les favoris et les notes utilisent également des tables séparées.

Cela évite de stocker plusieurs valeurs dans une seule colonne et permet de respecter une structure relationnelle claire et facilement exploitable.

### Optimisation 3

**Optimisation :**

Contraintes `UNIQUE`.

**Justification :**

Des contraintes `UNIQUE` sont utilisées notamment sur `users.email`, `categories.name` et `ingredients.name`.

Elles empêchent la création de doublons et garantissent que certaines informations importantes restent uniques dans la base de données.

## 14. Schéma de la base de données

Créez un dossier spécifique pour conserver les schémas de votre base de données.

```text
database/
└── schema/
    ├── mcd/
    │   └── mcd
    └── mld/
        └── mld
```

Vous pouvez également conserver :

- une version image ;
- une version PDF ;
- le fichier original de votre logiciel de modélisation.

L'objectif est qu'un autre développeur puisse comprendre rapidement la structure de votre base.

## 15. Documentation de la base

Dans :

```text
database/README.md
```

expliquez comment reconstruire la base de données.

Votre documentation doit au minimum indiquer :

1. comment créer la base ;
2. dans quel ordre exécuter les scripts ;
3. comment créer les tables ;
4. comment créer l'utilisateur SQL ;
5. comment charger les données ;
6. comment lancer les requêtes de test.

## 16. Test de reconstruction

Une fois votre travail terminé :

1. sauvegardez votre travail ;
2. supprimez la base de données de test ;
3. recréez-la uniquement à partir de vos scripts ;
4. exécutez le script de création des tables ;
5. exécutez le script de remplissage ;
6. exécutez les requêtes de test ;
7. vérifiez le résultat.

Si vous devez recréer manuellement une table ou ajouter manuellement des données pour que l'application fonctionne, vos scripts ne sont pas encore complets.

## 17. Vérification finale

| Critère                                                           | Validé |
| ----------------------------------------------------------------- | :----: |
| La base peut être recréée uniquement avec les scripts             |    ☑   |
| Toutes les tables du MLD sont présentes                           |    ☑   |
| Les clés primaires sont définies                                  |    ☑   |
| Les clés étrangères sont définies                                 |    ☑   |
| Les contraintes sont cohérentes                                   |    ☑   |
| Toutes les tables contiennent des données réalistes               |    ☑   |
| L'utilisateur SQL de l'application existe                         |    ☑   |
| L'application n'utilise pas `root`                                |    ☑   |
| Les droits SQL sont limités au nécessaire                         |    ☑   |
| Les requêtes nécessaires aux vues sont identifiées                |    ☑   |
| Les requêtes ont été écrites                                      |    ☑   |
| Les requêtes ont été exécutées et testées                         |    ☑   |
| Les informations nécessaires aux vues sont disponibles            |    ☑   |
| Les relations importantes possèdent une règle `ON DELETE` adaptée |    ☑   |
| Les choix `CASCADE`, `RESTRICT` ou `SET NULL` sont justifiés      |    ☑   |
| Les conséquences d'une suppression ont été testées                |    ☑   |
| Les règles `ON UPDATE` ont été réfléchies                         |    ☑   |
| Les optimisations sont identifiées                                |    ☑   |
| Les optimisations sont justifiées                                 |    ☑   |
| Le MCD et le MLD sont conservés dans le projet                    |    ☑   |
| La structure des dossiers est claire                              |    ☑   |
| Le `README.md` explique comment reconstruire la base              |    ☑   |

## Livrables attendus

- Dossier `database/schema/` contenant le MCD et le MLD.

- Dossier `database/scripts/` contenant tous les scripts SQL.

- Les scripts SQL

- Jeu de données réaliste dans chaque table.

- Tableau des requêtes nécessaires pour chaque vue.

- Résultats des tests des requêtes.

- Choix et justification des règles `ON DELETE`.

- Réflexion sur les règles `ON UPDATE`.

- Liste des optimisations du schéma.

- Justification des optimisations.

- Fichier `database/README.md` expliquant comment reconstruire la base.

## 18. Défi

Imaginez maintenant que votre application ne contient plus quelques dizaines de recettes mais :

* **50 000 utilisateurs** ;
* **100 000 recettes** ;
* **500 000 commentaires** ;
* **1 000 000 de notes** ;
* plusieurs millions de favoris et de relations entre recettes et ingrédients.

Votre base fonctionne toujours, mais certaines pages deviennent lentes.

Analysez votre base et expliquez ce que vous pourriez améliorer.

Vous pouvez notamment réfléchir à :

* l'utilisation des index ;
* les colonnes utilisées dans les recherches ;
* les jointures ;
* les tris ;
* les agrégations ;
* les requêtes exécutées fréquemment ;
* la pagination ;
* la quantité de données retournée par une requête ;
* la structure de certaines tables.

**Votre analyse :**

Avec un grand nombre de données, il serait important d'ajouter des index sur les colonnes fréquemment utilisées dans les recherches, les jointures et les tris. Par exemple, un index pourrait être ajouté sur `recipes.name` pour améliorer la recherche des recettes.

Les requêtes devraient également retourner uniquement les colonnes nécessaires afin de réduire la quantité de données transférées. Les pages contenant beaucoup de recettes devraient utiliser une pagination plutôt que de charger toutes les recettes en une seule fois.

Les requêtes utilisant des agrégations, comme le calcul de la note moyenne avec `AVG()`, pourraient devenir plus coûteuses avec un million de notes. Il faudrait donc vérifier ces requêtes et leurs index avec `EXPLAIN` afin d'identifier les opérations lentes.

Les jointures entre les tables comme `recipes`, `users`, `comments`, `ratings` et `favorites` devraient également être optimisées avec des index adaptés sur les colonnes utilisées pour les relations.

Enfin, les requêtes exécutées très fréquemment pourraient être optimisées ou utiliser un système de cache afin d'éviter de recalculer constamment les mêmes informations.

---

## 19. Auto-évaluation

À la fin de cette compétence, indiquez le niveau que vous pensez avoir atteint.

| Compétence                                     | Débutant | Intermédiaire | Avancé |
| ---------------------------------------------- | :------: | :-----------: | :----: |
| Créer une base de données                      |     ☐    |       ☐       |    ☑   |
| Créer les tables et les relations              |     ☐    |       ☐       |    ☑   |
| Créer et utiliser des scripts SQL              |     ☐    |       ☐       |    ☑   |
| Insérer des données réalistes                  |     ☐    |       ☑       |    ☐   |
| Écrire des requêtes SQL                        |     ☐    |       ☑       |    ☐   |
| Utiliser des jointures                         |     ☐    |       ☑       |    ☐   |
| Déterminer les requêtes nécessaires à une vue  |     ☐    |       ☑       |    ☐   |
| Tester et vérifier les données                 |     ☐    |       ☑       |    ☐   |
| Créer un utilisateur SQL adapté                |     ☐    |       ☑       |    ☐   |
| Choisir une stratégie `ON DELETE` adaptée      |     ☐    |       ☑       |    ☐   |
| Comprendre `CASCADE`, `RESTRICT` et `SET NULL` |     ☐    |       ☑       |    ☐   |
| Justifier les règles d'intégrité référentielle |     ☐    |       ☑       |    ☐   |
| Identifier des optimisations                   |     ☐    |       ☑       |    ☐   |
| Justifier mes choix techniques                 |     ☐    |       ☑       |    ☐   |
| Maintenir une structure de projet claire       |     ☐    |       ☐       |    ☑   |
