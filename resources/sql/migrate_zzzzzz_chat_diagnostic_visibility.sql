-- Let chatters see the chat's own messages (a taken nickname, flood control,
-- a kick). The message bar shows a diagnostic to a group only when
-- diagnostic_visibility lists it; nothing listed these, so guests and members
-- were sent back to the form without a word. Codes already set in
-- Admin → Access are left alone; re-running is harmless.

-- Everyone who can use the chat.
INSERT INTO `diagnostic_visibility` (`code`, `group_name`)
SELECT c.code, g.group_name
  FROM (SELECT 'astrx.chat/db_error' AS code
      UNION ALL SELECT 'astrx.chat/gate_denied'
      UNION ALL SELECT 'astrx.chat/empty'
      UNION ALL SELECT 'astrx.chat/too_long'
      UNION ALL SELECT 'astrx.chat/flood'
      UNION ALL SELECT 'astrx.chat/muted'
      UNION ALL SELECT 'astrx.chat/room_forbidden'
      UNION ALL SELECT 'astrx.chat/room_not_found'
      UNION ALL SELECT 'astrx.chat/nick_invalid'
      UNION ALL SELECT 'astrx.chat/entry_password'
      UNION ALL SELECT 'astrx.chat/not_found'
      UNION ALL SELECT 'astrx.chat/kicked'
      UNION ALL SELECT 'astrx.chat/banned'
      UNION ALL SELECT 'astrx.chat/nick_taken'
      UNION ALL SELECT 'astrx.chat/censored'
      UNION ALL SELECT 'astrx.chat/filter_blocked'
      UNION ALL SELECT 'astrx.chat/filter_kicked'
      UNION ALL SELECT 'astrx.chat/nick_blocked'
      UNION ALL SELECT 'astrx.chat/upload_disabled'
      UNION ALL SELECT 'astrx.chat/upload_error'
      UNION ALL SELECT 'astrx.chat/upload_too_big'
      UNION ALL SELECT 'astrx.chat/upload_type'
      UNION ALL SELECT 'astrx.chat/upload_invalid'
      UNION ALL SELECT 'astrx.chat/upload_failed'
      UNION ALL SELECT 'astrx.chat/pm_target'
      UNION ALL SELECT 'astrx.chat/not_in_chat'
      UNION ALL SELECT 'astrx.chat/full'
      UNION ALL SELECT 'astrx.chat/unknown') c
 CROSS JOIN (SELECT 'GUEST' AS group_name UNION ALL SELECT 'USER' UNION ALL SELECT 'MOD') g
 WHERE NOT EXISTS (SELECT 1 FROM `diagnostic_visibility` v WHERE v.`code` = c.code);
