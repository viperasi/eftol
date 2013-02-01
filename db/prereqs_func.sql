DELIMITER $$

USE `eftol_db`$$

DROP FUNCTION IF EXISTS `prereqs`$$

CREATE DEFINER=`root`@`localhost` FUNCTION `prereqs`(VALUE INT) RETURNS INT(11)
    READS SQL DATA
BEGIN
DECLARE _id INT;
	DECLARE _parent INT;
	DECLARE _next INT;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET @id = NULL;
	SET _parent = @id;
	SET _id = -1;
	
	IF @id IS NULL THEN
			RETURN NULL;
	END IF;
	
	LOOP
		SELECT 
			MIN(COALESCE(valueFloat, valueInt)) AS id, IF(MIN(COALESCE(valueFloat, valueInt)), CONCAT(@path, ',', _parent), @path)
		INTO @id, @path
		FROM `dgmtypeattributes` 
		WHERE 
			typeID = _parent AND attributeID IN (182,183,184,1285,1289,1290)
			AND COALESCE(valueFloat, valueInt)	> _id;
			IF @id IS NOT NULL OR _parent = @start_with THEN
				SET @level = @level + 1;
				SET @parent = _parent;
				RETURN @id;
			END IF;
			IF @path = '' THEN
				RETURN NULL;
			END IF;
			SET @level := @level - 1;
			SELECT  _parent, SUBSTRING_INDEX(@path, ',', -1), SUBSTRING(@path, 1, (LENGTH(@path)-(LENGTH(SUBSTRING_INDEX(@path, ',', -1)) +1)))
			INTO    _id, _parent, @path;
	END LOOP;
    END$$

DELIMITER ;