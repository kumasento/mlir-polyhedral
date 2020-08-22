#ifndef POLYMER_OSLSCOP_H
#define POLYMER_OSLSCOP_H

#include <cassert>
#include <cstdint>
#include <vector>

struct osl_scop;

namespace polymer {

/// A wrapper for the osl_scop struct in the openscop library.
class OslScop {
public:
  OslScop();
  ~OslScop();

  /// Print the content of the Scop to the stdout.
  void print();

  /// Validate whether the scop is well-formed.
  bool validate();

  /// Simply create a new statement in the linked list scop->statement.
  void createStatement();

  /// Create a new relation and initialize its contents. The new relation will
  /// be created under the scop member.
  /// The target here is an index:
  /// 1) if it's 0, then it means the context;
  /// 2) otherwise, if it is a positive number, it corresponds to a statement of
  /// id=(target-1).
  void addRelation(int target, int type, int numRows, int numCols,
                   int numOutputDims, int numInputDims, int numLocalDims,
                   int numParams, std::vector<std::vector<int64_t>> &eqs,
                   std::vector<std::vector<int64_t>> &inEqs);

private:
  struct osl_scop *scop;
};

} // namespace polymer

#endif