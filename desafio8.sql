DELIMITER //

CREATE TRIGGER trigger_usuario_delete
  BEFORE DELETE ON SpotifyClone.Users
  FOR EACH ROW
BEGIN

  SET @user_id = (
    SELECT u.user_id FROM SpotifyClone.Users u WHERE u.user = OLD.user
  );
  DELETE FROM SpotifyClone.Listened_to WHERE user_id = @user_id;
  DELETE FROM SpotifyClone.Followed_by WHERE user_id = @user_id;

END //

DELIMITER ;