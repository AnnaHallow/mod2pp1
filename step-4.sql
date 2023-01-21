-- select the park name, campground name, open_from_mm, open_to_mm & daily_fee ordered by park name and then campground name
-- (expected: 7 rows, starting with "Blackwoods")
SELECT p.name AS park_name, c.name AS campground_name, c.open_from_mm, c.open_to_mm, c.daily_fee
FROM park p
JOIN campground c USING(park_id)
ORDER BY p.name, c.name;

-- select the park name and the total number of campgrounds for each park ordered by park name
-- (expected: 3 rows, starting with "Acadia")
SELECT p.name AS park_name, COUNT(c.campground_id) AS num_of_campgrounds
FROM park p
JOIN campground c USING(park_id)
GROUP BY park_id
ORDER BY park_name;

-- select the park name, campground name, site number, max occupancy, accessible, max rv length, utilities where the campground name is 'Blackwoods'
-- (expected: 12 rows)
SELECT p.name AS park_name, c.name AS campground_name, s.site_id, s.max_occupancy, s.accessible, s.max_rv_length, s.utilities
FROM park p
JOIN campground c USING(park_id)
JOIN site s USING(campground_id)
WHERE c.name = 'Blackwoods';

-- select site number, reservation name, reservation from and to date ordered by reservation from date
-- (expected: 44 rows, starting with the earliest date)
SELECT s.site_number, r.name AS reservation_name, r.from_date, r.to_date
FROM site s
JOIN reservation r USING(site_id)
ORDER BY r.from_date;
