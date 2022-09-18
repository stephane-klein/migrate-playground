--! Previous: -
--! Hash: sha1:13b0b4ea829fba7098986894b6ea5c3858d4e20e

-- Enter migration here

CREATE SCHEMA IF NOT EXISTS public;

CREATE EXTENSION IF NOT EXISTS citext WITH SCHEMA public;
CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;

DROP TABLE IF EXISTS public.users;

CREATE TABLE public.users (
  id                 UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  username           CITEXT NOT NULL UNIQUE,
  email              VARCHAR DEFAULT NULL,
  firstname          VARCHAR DEFAULT NULL,
  lastname           VARCHAR DEFAULT NULL,
  password_hash      VARCHAR DEFAULT NULL,

  created_at         TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at         TIMESTAMPTZ NOT NULL DEFAULT now()
);
