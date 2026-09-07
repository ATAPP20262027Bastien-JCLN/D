use recipe_app;

-- Afficher tous les utilisateurs
SELECT id, name, email FROM users;

-- Afficher toutes les recettes
SELECT id, name, description FROM recipes;

-- Afficher les recettes avec leur catégorie
SELECT r.id, r.name, r.description, c.name AS category_name FROM recipes r JOIN categories c ON r.category_id = c.id;

-- Afficher les ingrédients d'une recette
SELECT i.name, ri.quantity, ri.unit FROM recipe_ingredients ri JOIN ingredients i ON ri.ingredient_id = i.id WHERE ri.recipe_id = 1;

-- Afficher les commentaires d'une recette
SELECT u.name AS user_name, c.content, c.created_at FROM comments c JOIN users u ON c.user_id = u.id WHERE c.recipe_id = 1;

-- Afficher la note moyenne d'une recette
SELECT AVG(score) AS average_rating FROM ratings WHERE recipe_id = 1;

-- Afficher les favoris d'un utilisateur
SELECT r.id, r.name, r.description FROM recipes r JOIN favorites f ON r.id = f.recipe_id WHERE f.user_id = 1;


-- Afficher toutes les recettes d'un utilisateur avec leur catégorie, la note moyenne, ses commentaires et ses ingrédients
SELECT 
    r.id AS recipe_id,
    r.name AS recipe_name,
    r.description AS recipe_description,
    c.name AS category_name,
    ROUND(AVG(ra.score), 2) AS average_rating,

    GROUP_CONCAT(
        DISTINCT CONCAT(
            i.name, 
            ' (', 
            ri.quantity, 
            ' ', 
            ri.unit, 
            ')'
        ) 
        SEPARATOR ', '
    ) AS ingredients,

    GROUP_CONCAT(
        DISTINCT CONCAT(
            u.name, 
            ': ', 
            co.content
        ) 
        SEPARATOR ' | '
    ) AS comments

FROM recipes r

LEFT JOIN categories c 
    ON r.category_id = c.id

LEFT JOIN recipe_ingredients ri 
    ON r.id = ri.recipe_id

LEFT JOIN ingredients i 
    ON ri.ingredient_id = i.id

LEFT JOIN ratings ra 
    ON r.id = ra.recipe_id

LEFT JOIN comments co 
    ON r.id = co.recipe_id

LEFT JOIN users u 
    ON co.user_id = u.id

WHERE r.user_id = 1

GROUP BY 
    r.id,
    r.name,
    r.description,
    c.name

ORDER BY r.id;

-- ========================================
-- 03_test_queries.sql
-- Tests des requêtes des différentes vues
-- ========================================


-- ========================================
-- ACCUEIL
-- ========================================

SELECT
    r.id,
    r.name,
    r.description,
    c.name AS category_name
FROM recipes r
JOIN categories c ON r.category_id = c.id
ORDER BY r.id DESC
LIMIT 6;


-- ========================================
-- LISTE DES RECETTES
-- ========================================

SELECT
    r.id,
    r.name,
    r.description,
    c.name AS category_name,
    ROUND(AVG(ra.score), 2) AS average_rating
FROM recipes r
JOIN categories c ON r.category_id = c.id
LEFT JOIN ratings ra ON r.id = ra.recipe_id
GROUP BY r.id, r.name, r.description, c.name;


-- ========================================
-- DETAIL D'UNE RECETTE
-- ========================================

-- Informations principales
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

-- Ingrédients
SELECT
    i.name,
    ri.quantity,
    ri.unit
FROM recipe_ingredients ri
JOIN ingredients i ON ri.ingredient_id = i.id
WHERE ri.recipe_id = 1;

-- Note moyenne
SELECT
    ROUND(AVG(score), 2) AS average_rating
FROM ratings
WHERE recipe_id = 1;

-- Commentaires
SELECT
    u.name AS user_name,
    c.content,
    c.created_at
FROM comments c
JOIN users u ON c.user_id = u.id
WHERE c.recipe_id = 1
ORDER BY c.created_at DESC;


-- ========================================
-- RECHERCHE
-- ========================================

SELECT
    r.id,
    r.name,
    r.description,
    c.name AS category_name
FROM recipes r
JOIN categories c ON r.category_id = c.id
WHERE r.name LIKE '%curry%';


-- ========================================
-- FAVORIS
-- ========================================

SELECT
    r.id,
    r.name,
    r.description
FROM recipes r
JOIN favorites f ON r.id = f.recipe_id
WHERE f.user_id = 1;


-- ========================================
-- PROFIL UTILISATEUR
-- ========================================

SELECT
    u.id,
    u.name,
    u.email,
    r.name AS role
FROM users u
JOIN roles r ON u.id_role = r.id
WHERE u.id = 1;


-- ========================================
-- ADMINISTRATION
-- ========================================

-- Utilisateurs
SELECT
    u.id,
    u.name,
    u.email,
    r.name AS role
FROM users u
JOIN roles r ON u.id_role = r.id
ORDER BY u.id;

-- Recettes
SELECT
    r.id,
    r.name,
    u.name AS author,
    c.name AS category
FROM recipes r
LEFT JOIN users u ON r.user_id = u.id
LEFT JOIN categories c ON r.category_id = c.id
ORDER BY r.id;

-- Commentaires
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