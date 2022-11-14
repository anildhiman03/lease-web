<?php
/**
 * @var $faker \Faker\Generator
 * @var $index integer
 */
return [
    'server_id' => $index + 1, // this token belongs to this admin, needs to match # of admins/their PK
    'server_model' => $faker->sentence(6),
    'server_ram' => $faker->randomElement([2, 4, 8, 12, 16, 24, 32, 48, 64, 96]),
    'server_hard_disk_type' => $faker->randomElement(["SAS","SATA","SSD"]),
    'server_hard_disk_space' => $faker->randomElement([0, 250, 500, 1000, 2000, 3000, 4000, 8000, 12000, 24000, 48000, 72000]),
    'server_price' => $faker->randomFloat(),
    'server_location_id' => $faker->numberBetween(1,10),
    'server_created_at' => $faker->iso8601,
    'server_updated_at' => $faker->iso8601
];
