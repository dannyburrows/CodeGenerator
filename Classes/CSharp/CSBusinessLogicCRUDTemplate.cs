using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Validation;
using System.Linq;
using System.Threading.Tasks;

namespace ###namespace###
{
    public sealed class ###model-name###
    {
        #region "Create"

        public async Task<###model-name###> Insert(###model-name### ###model-parameter###)
        {
            Throw new NotImplementedException();
        } // Insert
        #endregion

        #region "Read"

        public async Task<###model-name###> Get(int Id)
        {
            Throw new NotImplementedException();
        } // Get
        #endregion

        #region "Update"

        public async Task<List<string>> Update(###model-name### ###model-parameter###)
        {
            Throw new NotImplementedException();
        } // Update
        #endregion

        #region "Destroy"

        public async Task<List<string>> Delete(int Id)
        {
            Throw new NotImplementedException();
        } // Delete
        
        #endregion
    }
}