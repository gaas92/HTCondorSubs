import argparse

parser = argparse.ArgumentParser(description='Script used to run on HTCondor confidence intervals using Antonio Cota Method',
                                 epilog='Test example: python FH_distributor.py',
                                 add_help=True)

parser.add_argument ('--HELP',    '-H', default=False,  action='store_true', help='Print help message.')

parser.add_argument('--Nfh',     '-N', default=50,   type=int, help='an integer for the Number of jobs/FH points to generate')
parser.add_argument('--Range',   '-R', default='full',    type=str, choices=['full', '1sigma', '2sigma', '3sigma'], help='str to define the FH range to generate')
parser.add_argument("--Bins",    '-Bins',  nargs="+", default=["1", "2", "3", "4", "5", "6", "7"])


args = parser.parse_args()

if args.HELP:
    parser.print_help()
    exit()


if __name__ == "__main__":
    if args.Range == 'full':
        range_ = [0.0, 3.0]
        step_size = (range_[1] - range_[0]) / args.Nfh

        step_list = []
        for bin_ in args.Bins:
            for j in range(args.Nfh+1):
                #Table Structure : 
                # Bin step FH
                this_element = f'{bin_} {j} {range_[0] + j*step_size }'
                step_list.append(this_element)

        with open(f'runsConfidenceIntevals.txt', 'w') as f:
            for item in step_list:
                f.write(f"{item}\n")

        
    else :
        print('Range not implemented yet !')
    print('main ok')