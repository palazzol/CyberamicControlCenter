import subprocess
import pathlib
import sys
import platform
import shlex

class XBuild:
    def __init__(self):
        self.fileroot = sys.argv[1]
        self.tooldir = pathlib.Path('..') / 'tools'
        if platform.system() == 'Windows':
            self.tooldir = self.tooldir / 'windows'
            self.toolsuffix = '.exe'
        elif platform.system() == 'Linux':
            self.tooldir = self.tooldir / 'linux'
            self.toolsuffix = ''

    def getArgs(self, n, usage):
        if len(sys.argv) != n + 1:
            print(usage)
            sys.exit(-1)
        return sys.argv[1:] 
    
    def runcmd(self, program, message, error_message):
        programs = shlex.split(program)
        programs[0] = self.tooldir / f'{programs[0]}{self.toolsuffix}'
        print(message)
        print(f'    {program}')
        rv = subprocess.run(programs, 
                            text=True,
                            stdout=subprocess.PIPE,
                            stderr=subprocess.STDOUT)
        if rv.returncode != 0:
            print(error_message)
            for line in rv.stdout.splitlines():
                print(f'    {line}')
            sys.exit(-1)

def main():
    # Default
    xb = XBuild('')

    [filenameroot] = xb.getArgs(1,'Usage: build.py <filenameroot>')

    xb.print('Assembling...')
    xb.runCmd(f'as6500 -o -p -s -l "{filenameroot}.asm"',
              'Error(s) during assemble:')
    
    xb.print('Linking...')
    xb.runCmd(f'aslink -n -m -u -s "{filenameroot}.rel"',
              'Error(s) during link:')
    
    xb.print('Converting s19 to bin...')
    xb.runCmd(f'objcopy -I srec -O binary "{filenameroot}.s19" "{filenameroot}.bin"',
              'Error(s) during conversion:')

    xb.print('Comparing...')
    xb.runCmd(f'cmp -b "{filenameroot}_ref.bin" "{filenameroot}.bin"', 
              'Error(s) during compare:')
    
    xb.print('Success!')

    xb = XBuild('clean')

    [filenameroot] = xb.getArgs(1,'Usage: build.py <filenameroot>')

    xb.print('Cleaning...')
    xb.runCmd(f'rm "{filenameroot}.bin"')
    xb.runCmd(f'rm "{filenameroot}.s19"')
    xb.runCmd(f'rm "{filenameroot}.rel"')
    xb.runCmd(f'rm "{filenameroot}.sym"')
    xb.runCmd(f'rm "{filenameroot}.rst"')
    xb.runCmd(f'rm "{filenameroot}.map"')
    xb.runCmd(f'rm "{filenameroot}.lst"')
    xb.runCmd(f'rm "{filenameroot}.hlr"')

    xb.print('Success!')

if __name__ == "__main__":
    main()
