import java.io.IOException;
import java.util.StringTokenizer;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Job;
import org.apache.hadoop.mapreduce.Mapper;
import org.apache.hadoop.mapreduce.Reducer;
import org.apache.hadoop.mapreduce.lib.input.FileInputFormat;
import org.apache.hadoop.mapreduce.lib.output.FileOutputFormat;
import java.util.HashSet;
import java.util.Set;
import java.util.Map;


public class StylePhrase {

  public static class StylePhraseMapper extends Mapper<Object, Text, Text, IntWritable>{

    public void map(Object key, Text value, Context context) throws IOException, InterruptedException {
		
	  StringTokenizer itr = new StringTokenizer(value.toString());
      int i = 0;
      Text word = new Text();
      while (itr.hasMoreTokens()) {
			word.set(itr.nextToken());
			String txt = word.toString();
			i++;
			if(txt.contains(".")) break;
      }
		
	  context.write(new Text("phrase"), new IntWritable(i));
    }
  }

  public static class StylePhraseReducer extends Reducer<Text,IntWritable,Text,IntWritable> {
	  
	private IntWritable result = new IntWritable();

    public void reduce(Text key, Iterable<IntWritable> values, Context context ) throws IOException, InterruptedException {
		
	  int max = 0;
      for (IntWritable val : values) {
		  if(max < val.get())
			max = val.get();
      }
      result.set(max);
      context.write(key, result);
    }
  }

  public static void main(String[] args) throws Exception {
	  
    Configuration conf = new Configuration();
    Job job = Job.getInstance(conf, "anagrammes counter");
    
    job.setJarByClass(StylePhrase.class);
    job.setMapperClass(StylePhraseMapper.class);
    job.setReducerClass(StylePhraseReducer.class);
    job.setOutputKeyClass(Text.class);
    job.setOutputValueClass(IntWritable.class);
    
    FileInputFormat.addInputPath(job, new Path(args[0]));
    FileOutputFormat.setOutputPath(job, new Path(args[1]));
    
    System.exit(job.waitForCompletion(true) ? 0 : 1);
  }
}
