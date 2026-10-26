-- ---------- chat pages are routable ----------
-- ============================================================
-- Chat pages must be hidden=0. A hidden page is a 404 for everyone but
-- admins, who get a "this page is hidden" banner instead. The chat pages are
-- protected by their own controllers (CHAT_MODERATE, ADMIN_CONFIG_CHAT), and
-- `hidden` has nothing to do with the navbar, which comes from the `navbar`
-- table. INSERT IGNORE can't fix an existing row, hence this UPDATE.
--
-- Runs after every page-registration piece. Idempotent (rows already at 0
-- are skipped).
-- ============================================================

UPDATE `page`
   SET `hidden` = 0
 WHERE `hidden` <> 0
   AND `url_id` IN (
       'WORDING_CHAT',
       'WORDING_CHAT_STREAM',
       'WORDING_CHAT_LOGIN',
       'WORDING_CHAT_WAIT',
       'WORDING_CHAT_USERS',
       'WORDING_CHAT_PM',
       'WORDING_CHAT_SETTINGS',
       'WORDING_CHAT_HELP',
       'WORDING_CHAT_ADMIN',
       'WORDING_ADMIN_CONFIG_CHAT',
       'WORDING_ADMIN_CHAT_FILTERS'
   );

-- ============================================================
-- VERIFICATION:
--   SELECT url_id, file_name, hidden FROM `page`
--    WHERE url_id LIKE '%CHAT%';
--   Expected: every chat page hidden=0.
-- ============================================================
