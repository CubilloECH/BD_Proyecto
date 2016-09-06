DELIMITER $$

DROP PROCEDURE IF EXISTS `sp_samAddRegPer`$$

CREATE PROCEDURE sp_samAddRegPer
(
  P_SAM07CedUsr    VARCHAR(10),
  P_SAM07NomPers   VARCHAR(50), 
  P_SAM07ApePers1  VARCHAR(50),
  P_SAM07ApePers2  VARCHAR(50),
  P_SAM07TelefOfi  VARCHAR(50),
  P_SAM07TelefPers VARCHAR(50),
  P_SAM07CorrPers  VARCHAR(50)
)
BEGIN
    IF NOT EXISTS(SELECT C.SAM07CedUsr FROM SAM07RegPers AS C WHERE C.SAM07CedUsr = P_SAM07CedUsr)
      THEN
       INSERT INTO SAM07RegPers(SAM07CedUsr, SAM07NomPers, SAM07ApePers1,SAM07ApePers2,SAM07TelefOfi,SAM07TelefPers,SAM07CorrPers)
       VALUES ( P_SAM07CedUsr,P_SAM07NomPers,P_SAM07ApePers1,P_SAM07ApePers2,P_SAM07TelefOfi, P_SAM07TelefPers, P_SAM07CorrPers); 
       SELECT 'Registro agregado con exito!';
    ELSE
      SELECT 'Este cliente ya existe en la base de datos!';
    END IF;
END $$

DELIMITER ;

//--------------------------------------------------------------------------------//


DELIMITER $$

USE `sam`$$
DROP PROCEDURE IF EXISTS `sp_samDelRegPer`$$ /*~eliminar Registro de Persona*/

CREATE PROCEDURE sp_samDelRegPer(p_SAM07CedUsr VARCHAR(10))
BEGIN
   DELETE FROM SAM07RegPer WHERE SAM07RegPer.`SAM07CedUsr`=p_SAM07CedUsr;
END $$

DELIMITER ;


//----------------------------------------------------------------------------------//


DELIMITER $$

USE `sam`$$

DROP PROCEDURE IF EXISTS `Sp_samShwRegPer`$$

CREATE PROCEDURE Sp_samShwRegPer()
  BEGIN
    SELECT SAM07RegPer.SAM07CedUsr, SAM07RegPer.SAM07NomPers, SAM07RegPer.SAM07ApePers1, SAM07RegPer.SAM07ApePers2, 
    SAM07RegPer.SAM07TelefOfi, SAM07RegPer.SAM07TelefPers, SAM07RegPer.SAM07CorrPers FROM SAM07RegPer;
  END $$

DELIMITER ;


//-----------------------------------------------------------------------------------//


DELIMITER $$

USE `sam`$$
DROP PROCEDURE IF EXISTS `sp_samSrhRegPer`$$

CREATE PROCEDURE sp_samSrhRegPer(IN p_SAM07CedUsr VARCHAR(10))
BEGIN
SELECT SAM07CedUsr,SAM07NomPers,SAM07ApePers1,SAM07ApePers2,SAM07TelefOfi,SAM07TelefPers,SAM07CorrPers FROM SAM07RegPer WHERE SAM07RegPer.`SAM07CedUsr`=p_SAM07CedUsr;
END $$

DELIMITER ;

//-------------------------------------------------------------------------------------//


DELIMITER $$

USE `sam`$$

DROP PROCEDURE IF EXISTS `sp_SamUpdPer`$$

CREATE PROCEDURE `sp_SamUpdPer`
(
  P_SAM07CedUsr       VARCHAR(10),
  P_SAM07NomPers      VARCHAR(50), 
  P_SAM07ApePers1     VARCHAR(50),
  P_SAM07ApePers2     VARCHAR(50),
  P_SAM07TelfOfi      VARCHAR(20),
  P_SAM07TelfPers     VARCHAR(20),
  P_SAM07CorrPers     VARCHAR(20)
)
BEGIN

    IF NOT EXISTS(SELECT SAM07CedUsr FROM SAM07RegPer WHERE SAM07CedUsr = P_SAM07CedUsr)
    THEN
      SELECT 'Este Registro no existe!';
    
    ELSE
         UPDATE `SAM07RegPer`
            SET SAM07NomPers=P_SAM07NomPers,
            SAM07ApePers1=P_SAM07ApePers1,
            SAM07ApePers2=P_SAM07ApePers2,
            SAM07TelefOfi=P_SAM07TelfOfi,
            SAM07TelefPers=P_SAM07TelfPers,
            SAM07CorrPers=P_SAM07CorrPers
         WHERE SAM07CedUsr= P_SAM07CedUsr;
    SELECT 'Valor actualizados con exito!';
    END IF;
END $$

DELIMITER ;