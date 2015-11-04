using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;

namespace ###namespace###
{
    public class ###model-name### ###baseApi###
    {
        #region "Get"

        [HttpGet]
        public async Task<IHttpActionResult> Get()
        {
            Throw New NotImplementedException();
            Return Ok();
        }

        #endregion

        #region "Post"

        [HttpPost]
        public async Task<IHttpActionResult> Post(###model-name### modelName)
        {
            Throw New NotImplementedException();
        }

        #endregion

        #region "Put"

        [HttpPut]
        public async Task<IHttpActionResult> Update(###model-name### modelName)
        {
            Throw New NotImplementedException();
        }

        #endregion

        #region "Delete"

        [HttpDelete]
        public async Task<IHttpActionResult> Delete(int ID)
        {
            Throw New NotImplementedException();
        }

        #endregion
    }
}