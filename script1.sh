#script1.sh
echo "script runnning ..."
mkdir -p shell_script
dotnet new sln --name mysolution
dotnet new mvc --name mysolution --output shell_script
dotnet sln mysolution.sln add shell_script/mysolution.csproj
dotnet restore
dotnet add shell_script/mysolution.csproj package Microsoft.EntityFrameworkCore.Tools --version 7.0.1 
dotnet add shell_script/mysolution.csproj package Microsoft.EntityFrameworkCore.SqlServer --version 7.0.1 


cat >> shell_script/Models/Product.cs << 'END'
namespace mysolution.Models
{    
    public class Product
    {
        public int ProductId { get; set; }
    }
}
END
cat >> shell_script/Models/Category.cs << 'END'
namespace mysolution.Models
{   
    public class Category
    {
        public int CategoryId { get; set; }
		public string CategoryName { get; set; }
		public string Description { get; set; }
    }
}
END
 echo " script succesfully finished!"
#cat script1.sh