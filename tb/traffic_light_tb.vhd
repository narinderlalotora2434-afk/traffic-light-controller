library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity traffic_light_tb is
end traffic_light_tb;

architecture Behavioral of traffic_light_tb is

    component traffic_light
        Port (
            clk   : in STD_LOGIC;
            reset : in STD_LOGIC;
            red   : out STD_LOGIC;
            yellow: out STD_LOGIC;
            green : out STD_LOGIC
        );
    end component;

    signal clk   : STD_LOGIC := '0';
    signal reset : STD_LOGIC := '0';
    signal red   : STD_LOGIC;
    signal yellow: STD_LOGIC;
    signal green : STD_LOGIC;

begin

    uut: traffic_light port map (
        clk => clk,
        reset => reset,
        red => red,
        yellow => yellow,
        green => green
    );

    -- Clock generation (10ns period)
    clk_process : process
    begin
        while true loop
            clk <= '0';
            wait for 5 ns;
            clk <= '1';
            wait for 5 ns;
        end loop;
    end process;

    -- Stimulus process
    stim_proc: process
    begin
        reset <= '1';
        wait for 10 ns;
        reset <= '0';

        wait for 200 ns;

        wait;
    end process;

end Behavioral;
