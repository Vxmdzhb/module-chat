-- ---------- chat messages can be kept forever ----------
-- ============================================================
-- A NULL expires_at means "never expires": retention_minutes and
-- pm_retention_minutes of 0 (the default) keep messages until someone
-- deletes them. The garbage collector (expires_at <= NOW()) never matches
-- NULL, and the readers treat NULL as current.
--
-- Messages already written keep the expiry they were given. Idempotent.
-- ============================================================

ALTER TABLE `chat_message` MODIFY `expires_at` TIMESTAMP NULL DEFAULT NULL;
ALTER TABLE `chat_pm`      MODIFY `expires_at` TIMESTAMP NULL DEFAULT NULL;
