SELECT titleauthor.au_id, authors.au_fname, authors.au_lname, titles.title, publishers.pub_name
FROM titleauthor
INNER JOIN titles ON titleauthor.title_id = titles.title_id
INNER JOIN authors ON titleauthor.au_id = authors.au_id
INNER JOIN publishers ON publishers.pub_id = titles.pub_id;

SELECT titleauthor.au_id, authors.au_fname, authors.au_lname, COUNT(titles.title) AS title_count, publishers.pub_name
FROM titleauthor
INNER JOIN titles ON titleauthor.title_id = titles.title_id
INNER JOIN authors ON titleauthor.au_id = authors.au_id
INNER JOIN publishers ON publishers.pub_id = titles.pub_id
GROUP BY authors.au_id, publishers.pub_name
ORDER BY title_count DESC;

SELECT titleauthor.au_id, authors.au_fname, authors.au_lname, COUNT(titles.title) AS title_count
FROM titleauthor
INNER JOIN titles ON titleauthor.title_id = titles.title_id
INNER JOIN authors ON titleauthor.au_id = authors.au_id
GROUP BY authors.au_id
ORDER BY title_count DESC
LIMIT 3;

SELECT authors.au_id, authors.au_fname, authors.au_lname, COUNT(titles.title) AS total
FROM authors
LEFT JOIN titleauthor ON titleauthor.au_id = authors.au_id
LEFT JOIN titles ON titleauthor.title_id = titles.title_id
GROUP BY authors.au_id
ORDER BY total DESC;
