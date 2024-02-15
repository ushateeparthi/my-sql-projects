show create  database mavenmovies;
use mavenmovies;
-- 1.Write a SQL query to count the number of characters except for the spaces for each actor. Return the first 10 actors' name
-- lengths along with their names--
select first_name,last_name,char_length(concat(first_name,last_name)) 
from actor limit 10;
-- 2. List all Oscar awardees(Actors who received the Oscar award) with their full names and the length of their names --
select concat(aw.first_name," ",aw.last_name) as full_name,
length (concat (aw.first_name," ", aw.last_name)) as length from actor_award aw
left join actor a 
on aw.actor_id = a. actor_id 
where awards like "% oscar%";
-- 3.Find the actors who have acted in the film Frost Head--
select f.* from film  f join film_actor fa
on f.film_id = fa.film_id 
join actor a 
on a.actor_id= fa.actor_id
where title="frost head";
-- 4.Pull all the films acted by the actor Will Wilson--
select a.first_name,a.last_name,f.*from film f join film_actor fa
on f. film_id = fa.film_id 
join actor a
on a . actor_id = fa.actor_id 
where first_name ="will" and last_name="wilson";
-- 5.Pull all the films which were rented and return them in the month of May--
select r.return_date,f.*from film f 
join inventory i on i.film_id = f.film_id 
join rental r on i .inventory_id =r.inventory_id 
where month (r.return_date)=5;
-- 6.Pull all the films with Comedy category--
select * from film f inner join film_category fc
on f.film_id = fc.film_id  inner join 
category c 
on c.category_id = fc.category_id
where name ="comedy";





