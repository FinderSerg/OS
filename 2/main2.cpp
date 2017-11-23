#include <sys/types.h>
#include <unistd.h>
#include <ctime>
#include <fstream>
#include <iostream>
#include <sstream>
#include <string>
#include <vector>

using namespace std;

void genInput(string s, int n) {
    ofstream out(s);
    out << n << "\n";
    for (int i = 0; i < n; ++i) {
        out << rand() % (254 - 33 + 1) + 33 << (i < n - 1 ? " " : "\n");
    }
}

void func(size_t t, string s) {
    ifstream in(s);
    int n;
    in >> n;
    vector<int> a;
    for (int i = 0; i < n; ++i) {
        int q;
        in >> q;
        a.push_back(q);
    }
    in.close();
    int m = 150000;
    s.replace(s.find("2/"), 2, "2/out_");
    ofstream out(s);
    for (int i = 0; i < m; ++i) {
        int k = rand() % (24) + 1;
        for (int j = 0; j < k; ++j) {
            out << a[rand() % a.size()];
        }
        out << "\n";
    }
    out << "time: " << clock() - t << "\n";
    cerr << "time: " << clock() - t << "\n";
    out.close();
}

int main(int argc, char* argv[]) {
    cerr << "PID: " << getpid() << "\n";
    size_t t;
    int m, i;
    if (argc == 4) {
        t = atoi(argv[1]);
        m = atoi(argv[2]);
        i = atoi(argv[3]);
    } else {
        cerr << "Wrong args\n";
        return 0;
    }
    srand(time(NULL));

    string theFile;
    stringstream file;
    file << "../files2/" << i << ".txt";
    theFile = file.str();
    genInput(theFile, m);

    func(t, theFile);

    return 0;
}
