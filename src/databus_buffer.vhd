library ieee;
use ieee.std_logic_1164.all;
----------------------------
-- Databus Buffer
----------------------------
ENTITY databus_buffer IS
-- data bus buffer have the next ports:
-- IDATA:        8 bit bus       ->inout
-- CTRL:        1 bit control   ->in
-- ODATA:       8 bit bus       ->inout
	PORT
	(
		--IDATA represent the bus lines that comes from the uC for reading and writing;
		--ODATA represents the bus lines that communicate with the internal bus;
      		IDATA:    INOUT   STD_LOGIC_VECTOR(7 DOWNTO 0);
      		CTRL:     IN      STD_LOGIC;
      		ODATA:    INOUT   STD_LOGIC_VECTOR(7 DOWNTO 0)
    	);

    

END databus_buffer;
ARCHITECTURE behaviour OF databus_buffer IS
-- behaviour of databus buffer;

BEGIN
-- is a 3 state bidirection 8 bit buffer.
-- if CTRL is 1, IDATA=ODATA; reading from counter operation
-- if CTRL is 0, ODATA=IDATA; writing to control word
-- if CTRL is Z, IDATA=Z; this happens when nor read and write are active but
-- cs is active;
-- also, data bus can be in 3rd state if the chip is not selected, this means
-- that CTRL will be Z;

	
	ODATA<=IDATA WHEN CTRL='0' else "ZZZZZZZZ";
	IDATA<=ODATA WHEN CTRL='1' else "ZZZZZZZZ";

END behaviour;  