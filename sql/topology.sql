

/* create or look for nodes when a new pipes is created */
CREATE OR REPLACE FUNCTION distribution.topology_pipes_insert() RETURNS trigger AS ' 
	BEGIN
		UPDATE distribution.pipes SET
			id_node_a          = distribution.node_get_id(ST_StartPoint(NEW.geometry)),
			id_node_b          = distribution.node_get_id(ST_EndPoint(  NEW.geometry))
		WHERE id = NEW.id ;
		RETURN NEW;
	END;
' LANGUAGE 'plpgsql';
COMMENT ON FUNCTION distribution.topology_pipes_insert() IS 'Fcn/Trigger: create or look for nodes when a new pipes is created.';

/* prevent move of etremities of a pipe */
CREATE OR REPLACE FUNCTION distribution.topology_pipes_update() RETURNS trigger AS ' 
	BEGIN
		UPDATE distribution.pipes SET
			geometry = ST_SetPoint( ST_SetPoint( NEW.geometry , 0 , ST_StartPoint(OLD.geometry) ) , ST_NumPoints(geometry)-1 , ST_EndPoint(OLD.geometry) )
		WHERE id = NEW.id ;
		RETURN NEW;
	END;
' LANGUAGE 'plpgsql';
COMMENT ON FUNCTION distribution.topology_pipes_update() IS 'Fcn/Trigger: prevent move of etremities of a pipe. i.e. you have to move the node.';


/* move pipe extremities when moving node */
CREATE OR REPLACE FUNCTION distribution.topology_nodes_update() RETURNS trigger AS '
	DECLARE
		pipeitem RECORD;
	BEGIN
		FOR pipeitem IN SELECT id,geometry FROM distribution.pipes WHERE id_node_a = NEW.id LOOP
			UPDATE distribution.pipes SET geometry = ST_SetPoint( pipeitem.geometry , 0 , NEW.geometry );
		END LOOP;
		FOR pipeitem IN SELECT id,geometry FROM distribution.pipes WHERE id_node_b = NEW.id LOOP
			UPDATE distribution.pipes SET geometry = ST_SetPoint( pipeitem.geometry , ST_NumPoints(pipeitem.geometry)-1 , NEW.geometry );
		END LOOP;
		RETURN NEW;
	END;
' LANGUAGE 'plpgsql';
COMMENT ON FUNCTION distribution.topology_nodes_update() IS 'Fcn/Trigger: move pipe extremities when moving node.';
