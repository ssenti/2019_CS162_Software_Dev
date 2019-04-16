
#write an implementation of Wolfram's Rule 90 cellular automaton
#should be runnable using the run() method
#can assume a finite-sized list of automata
#can also choose the simplest initialization for your automaton

from template import AbstractSimulation

class rule_90(AbstractSimulation):
    def __init__(self, number_steps, number_cells):
        super().__init__(number_steps)
        self.number_cells = number_cells
        self.show_intermediate_steps = True
        start = '0' * int(self.number_cells/2) + '1' + '0' * int(self.number_cells/2)
        print("At 00 number of steps, cell pattern looks like this " + "'" + start + "'")

    def initialize_sim(self):
        self.count = 0
        self.initial_zeros = [0 for i in range(self.number_cells)]
        self.initial_zeros[int(self.number_cells/2)] = 1
        self.initial_pattern = ''.join(str(e) for e in self.initial_zeros)
        self.rule = {
            '111': '0','110': '1','101': '0','100': '1','011': '1','010': '0',
            '001': '1','000': '0'}

    def run_one_step(self):
        self.initial_pattern = self.create_child(self.initial_pattern)
        self.count += 1

    def create_child(self, initial_pattern):
        child = []
        for i in range(len(initial_pattern)-2):
            k = self.rule[initial_pattern[i:i+3]]
            child.append(k)
            real_child = '0' + ''.join(str(e) for e in child) + '0'
        return real_child

    def print_sim_state(self):
        if self.count < 10:
            self.count_print = "0" + str(self.count)
        else:
            self.count_print = str(self.count)
        print("At {} number of steps, cell pattern looks like this {}".format(
        self.count_print, repr(self.initial_pattern)))

r90 = rule_90(30, 40)
r90.run()
