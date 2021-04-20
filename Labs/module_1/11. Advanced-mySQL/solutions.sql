SELECT au_id, SUM(advance) + SUM(royalty_sum) AS profits
FROM (SELECT title_id, au_id, SUM(sales_royalty) AS royalty_sum, advance
FROM (SELECT titles.title_id, titleauthor.au_id, titles.advance * titleauthor.royaltyper / 100 AS advance, titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 AS sales_royalty
FROM titles
INNER JOIN titleauthor ON titleauthor.title_id = titles.title_id
LEFT JOIN sales ON sales.title_id = titles.title_id
WHERE advance IS NOT NUll
ORDER BY titles.title_id ) summary
GROUP BY title_id, au_id) summary2
GROUP BY au_id;

CREATE TEMPORARY TABLE publications.book_sale_income_per_author
SELECT titles.title_id, titleauthor.au_id, titles.advance * titleauthor.royaltyper / 100 AS advance, titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 AS sales_royalty
FROM titles
INNER JOIN titleauthor ON titleauthor.title_id = titles.title_id
LEFT JOIN sales ON sales.title_id = titles.title_id
WHERE advance IS NOT NUll
ORDER BY titles.title_id;

CREATE TEMPORARY TABLE publications.author_income_per_book
SELECT title_id, au_id, SUM(sales_royalty) AS royalty_sum, advance
FROM publications.book_sale_income_per_author
GROUP BY title_id, au_id;

CREATE TEMPORARY TABLE publications.author_profits
SELECT au_id, SUM(advance) + SUM(royalty_sum) AS profits
FROM publications.author_income_per_book
GROUP BY au_id;

CREATE TABLE publications.most_profiting_authors
SELECT au_id, profits
FROM publications.author_profits
ORDER BY - profits;
