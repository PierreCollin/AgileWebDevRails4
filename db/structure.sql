CREATE TABLE "carts" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "created_at" datetime, "updated_at" datetime);
CREATE TABLE "line_items" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "product_id" integer, "cart_id" integer, "created_at" datetime, "updated_at" datetime, "quantity" integer DEFAULT 1, "price" decimal);
CREATE TABLE "products" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "title" varchar(255), "description" text, "image_url" varchar(255), "price" decimal(8,2), "created_at" datetime, "updated_at" datetime);
CREATE TABLE "schema_migrations" ("version" varchar(255) NOT NULL);
CREATE INDEX "index_line_items_on_cart_id" ON "line_items" ("cart_id");
CREATE INDEX "index_line_items_on_product_id" ON "line_items" ("product_id");
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
INSERT INTO schema_migrations (version) VALUES ('20140217162354');

INSERT INTO schema_migrations (version) VALUES ('20140225101525');

INSERT INTO schema_migrations (version) VALUES ('20140225140600');

INSERT INTO schema_migrations (version) VALUES ('20140227130742');

INSERT INTO schema_migrations (version) VALUES ('20140227132408');

INSERT INTO schema_migrations (version) VALUES ('20140228210833');
