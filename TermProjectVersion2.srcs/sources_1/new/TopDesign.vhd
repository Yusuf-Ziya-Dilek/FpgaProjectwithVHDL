library IEEE;

use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity TopDesign is
    Port ( pulse_pin : in STD_LOGIC;
           pulse_pin_second : in STD_LOGIC;
           Trrigger_pin : out STD_LOGIC;
           clk : in STD_LOGIC;
           topSelDispA : out STD_LOGIC;
           topSelDispB : out STD_LOGIC;
           topSelDispC : out STD_LOGIC;
           topSelDispD : out STD_LOGIC;
           topSegA : out STD_LOGIC;
           topSegB : out STD_LOGIC;
           topSegC : out STD_LOGIC;
           topSegD : out STD_LOGIC;
           topSegE : out STD_LOGIC;
           topSegF : out STD_LOGIC;
           topSegG : out STD_LOGIC);
end TopDesign;

architecture Behavioral of TopDesign is

    component Range_Sensor is
        Port ( fpgaclk : in STD_LOGIC;
               pulse : in STD_LOGIC;
               triggerOut : out STD_LOGIC;
               meters : out STD_LOGIC_VECTOR (3 downto 0);
               decimeters : out STD_LOGIC_VECTOR (3 downto 0);
               centimeters : out STD_LOGIC_VECTOR (3 downto 0));    
    end component;
    
    component Range_Sensor_Second is
            Port ( fpgaclk : in STD_LOGIC;
                   pulse : in STD_LOGIC;
                   triggerOut : out STD_LOGIC;
                   meters : out STD_LOGIC_VECTOR (3 downto 0);
                   decimeters : out STD_LOGIC_VECTOR (3 downto 0);
                   centimeters : out STD_LOGIC_VECTOR (3 downto 0));    
   end component;
    
    component segHighModule is
        Port ( ssdDisp0 : in STD_LOGIC_VECTOR (3 downto 0);
               ssdDisp1 : in STD_LOGIC_VECTOR (3 downto 0);
               ssdDisp2 : in STD_LOGIC_VECTOR (3 downto 0);
               ssdDisp3 : in STD_LOGIC_VECTOR (3 downto 0);
               highSegA : out STD_LOGIC;
               highSegB : out STD_LOGIC;
               highSegC : out STD_LOGIC;
               highSegD : out STD_LOGIC;
               highSegE : out STD_LOGIC;
               highSegF : out STD_LOGIC;
               highSegG : out STD_LOGIC;
               selDispA : out STD_LOGIC;
               selDispB : out STD_LOGIC;
               selDispC : out STD_LOGIC;
               selDispD : out STD_LOGIC;
               clock : in STD_LOGIC);    
    end component;
    
    Signal Ai : std_logic_vector (3 downto 0);
    Signal Bi : std_logic_vector (3 downto 0);
    Signal Ci : std_logic_vector (3 downto 0);
    Signal Di : std_logic_vector (3 downto 0);
    
    Signal sensor_meters : std_logic_vector (3 downto 0);
    Signal sensor_decimeters : std_logic_vector (3 downto 0);
    Signal sensor_centimeters : std_logic_vector (3 downto 0);
    
    Signal sensor_meters_second : std_logic_vector (3 downto 0);
    Signal sensor_decimeters_second : std_logic_vector (3 downto 0);
    Signal sensor_centimeters_second : std_logic_vector (3 downto 0);
    
    Signal plus :std_logic_vector (3 downto 0);    
  
begin
    uut2 : segHighModule port map (
        ssdDisp0 => Ai, 
        ssdDisp1 => Bi, 
        ssdDisp2 => Ci, 
        ssdDisp3 => Di, 
        highSegA => topSegA, 
        highSegB => topSegB, 
        highSegC => topSegC, 
        highSegD => topSegD, 
        highSegE => topSegE, 
        highSegF => topSegF, 
        highSegG => topSegG, 
        selDispA => topSelDispA, 
        selDispB => topSelDispB, 
        selDispC => topSelDispC, 
        selDispD => topSelDispD, 
        clock => clk );
        
    uut4: Range_Sensor port map(
        fpgaclk => clk,
        triggerOut => Trrigger_pin,
        pulse  => pulse_pin,        
        meters => sensor_meters,
        decimeters => sensor_decimeters,
        centimeters  => sensor_centimeters   
    );
    
    uut5: Range_Sensor_Second port map(
        fpgaclk => clk,
        triggerOut => Trrigger_pin,
        pulse  => pulse_pin_second,        
        meters => sensor_meters_second,
        decimeters => sensor_decimeters_second,
        centimeters  => sensor_centimeters_second   
        );
    
    process(sensor_decimeters_second)
        Begin
            if(sensor_decimeters_second < "0010") then
                plus <= plus + 1;                
            elsif(sensor_decimeters_second > "0010")then
                plus <= "0000";   
            end if;              
    end process;                  
                    
        
    Ai <= sensor_centimeters;
    Bi <= sensor_decimeters;
    Ci <= plus;
    Di <= sensor_decimeters_second;
    
    
end Behavioral;
