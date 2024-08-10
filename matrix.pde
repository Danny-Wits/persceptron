class Matrix{
public int row;
public int column;
public float[][]data;

Matrix(float[][] x){
data=x;
row=data.length;
column=data[0].length;
}
Matrix randomize(float x,float y){
for(int i=0;i<row;i++){
   for(int j=0;j<column;j++){
      data[i][j]=random(x,y);
   }
   }
   return this;
}
 Matrix multiply(Matrix m2){
   float[][]resultA=new float[this.row][m2.column];
   int r=0;
   for(float[]row:data){
    float temp =0;
    int c=0;
    for(float value:row){
      temp+=value*m2.data[c][0];
      c++;
      }
     resultA[r][0]=temp;
     r++;
   }
   Matrix result=new Matrix(resultA);
  return result;
}
 public Matrix multiply(float x){
   for(int i=0;i<row;i++){
   for(int j=0;j<column;j++){
      data[i][j]*=x;
   }
   }
   return this;
}


public Matrix add(Matrix m2){
   float[][]resultA=new float[this.row][m2.column];
   for(int i=0;i<row;i++){
   for(int j=0;j<column;j++){
    resultA[i][j]= data[i][j]+m2.data[i][j];
   }
 }
  Matrix result=new Matrix(resultA);
  return result;
}

 public Matrix add(float x){
   for(int i=0;i<row;i++){
   for(int j=0;j<column;j++){
      data[i][j]+=x;
   }
   }
   return this;
}


Matrix transpose(){
 float[][]transA=new float[this.column][this.row];
 for(int i=0;i<row;i++){
   for(int j=0;j<column;j++){
      transA[j][i]=data[i][j];
   }
   }
  Matrix result=new Matrix(transA);
  return result;
}
//activation
void activation(){
for(int i=0;i<row;i++){
   for(int j=0;j<column;j++){
      data[i][j]=sigmoid( data[i][j]);
   }
   }
}
float sigmoid(float x){
  return 1 / (1 + (float)Math.exp(-x));
}
void log(){
for(float[]row:data){
    for(float value:row){
      print(value);
      print(",");
      }
      println("");
   }
}

}
