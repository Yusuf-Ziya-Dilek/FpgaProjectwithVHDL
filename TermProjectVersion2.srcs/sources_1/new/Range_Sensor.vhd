library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Range_Sensor is
    Port ( fpgaclk : in STD_LOGIC;
           pulse : in STD_LOGIC;
           triggerOut : out STD_LOGIC;
           meters : out STD_LOGIC_VECTOR (3 downto 0);
           decimeters : out STD_LOGIC_VECTOR (3 downto 0);
           centimeters : out STD_LOGIC_VECTOR (3 downto 0));
end Range_Sensor;

architecture Behavioral of Range_Sensor is
    component Distance_Calculation is
        Port ( clk : in STD_LOGIC;
                   Calculation_reset : in STD_LOGIC;
                   pulse : in STD_LOGIC;
                   distance : out STD_LOGIC_VECTOR (8 downto 0));
    end component;
    
    component Trigger_generator is
        Port ( clk : in STD_LOGIC;
               trigger : out STD_LOGIC);
    end component;
    
    component BCD_Converter is
        Port ( Distance_inputs : in STD_LOGIC_VECTOR (8 downto 0);
               hundreds : out STD_LOGIC_VECTOR (3 downto 0);
               tens : out STD_LOGIC_VECTOR (3 downto 0);
               unit : out STD_LOGIC_VECTOR (3 downto 0));    
    end component;
        
    Signal distanceOut : std_logic_vector (8 downto 0);
    Signal triggOut : std_logic;      

begin
    trigger_gen : Trigger_generator port map (fpgaclk, triggOut);
    Pulsewidth : Distance_Calculation port map (fpgaclk, triggOut, pulse, distanceOut);
    BCDConv : BCD_Converter port map (distanceOut, meters, decimeters, centimeters);
    
    triggerOut <= triggOut;
    
end Behavioral;
